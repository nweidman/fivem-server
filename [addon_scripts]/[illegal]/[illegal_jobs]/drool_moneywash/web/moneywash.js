let MaxSlots = 5;
let washers = {};        // keyed by machineName
let activeWasher = null; // currently opened washer
let activeDropdown = null;
let outsideClickHandler = null;
let isWasherMode = true;

// DOM references
const container = document.getElementById('moneywash-container');
const slotContainer = document.getElementById('slot-container');
const startStopBtn = document.getElementById('startStopBtn');
const washerDoor = document.querySelector('.washer-door');
const washerStatus = document.querySelector('.washer-status');
const currentWashAmountEl = document.getElementById('current-wash-amount');
const washLevel = document.querySelector('.washing-level');
const destructionRate = document.querySelector('.destruction-rate');

// ------------------- Helper Functions -------------------

// ------------------- Helper Functions -------------------

function formatTime(sec) {
    const m = Math.floor(sec / 60).toString().padStart(2, '0');
    const s = (sec % 60).toString().padStart(2, '0');
    return `${m}:${s}`;
}

function setStatusReady(amount = 0) {
    washerStatus.classList.remove('status-error');
    washerStatus.innerHTML = `
        <span class="status-text">${isWasherMode ? "READY TO WASH" : "READY TO DRY"}</span>
        <span class="status-money">$${amount}</span>
    `;
}


function showError(msg, duration = 3000) {
    washerStatus.classList.add('status-error');
    washerStatus.innerHTML = `<span class="status-text">${msg}</span>`;
    setTimeout(() => {
        if (!activeWasher) return;
        const washer = washers[activeWasher];
        if (!washer || !washer.currentBill) setStatusReady();
        washerStatus.classList.remove('status-error');
    }, duration);
}

function removeBill(amount) {
    fetch(`https://${GetParentResourceName()}/removeUndoneBill`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ 
            machineName: activeWasher,
            amount: amount,
         })
    });
}

// ------------------- Render Function -------------------

function renderWasherUI(washer) {
    if (!washer) return;

    // Update current bill display
    currentWashAmountEl.textContent = washer.currentBill ? washer.currentBill.amount : "0";

    // Clear slots
    slotContainer.innerHTML = '';

    // Create empty slots
    for (let i = 0; i < MaxSlots; i++) {
        const slot = document.createElement('div');
        slot.className = 'slot';
        slot.innerHTML = `<div class="num-circle">${i + 1}</div>`;
        slotContainer.appendChild(slot);
    }

    let slotIndex = 0;

    const nextInQueueEl = document.querySelector('#next-in-queue'); // give your <p> an ID

    if (MaxSlots <= 1) {
        nextInQueueEl.style.display = 'none';
    } else {
        nextInQueueEl.style.display = 'block'; // show it if more than 1 slot
    }

    const queue = Array.isArray(washer.queue) ? washer.queue : [];
    
    queue.forEach(bill => {
        if (slotIndex >= MaxSlots) return;

        const slot = slotContainer.children[slotIndex];
        slot.style.display = 'flex';
        slot.style.alignItems = 'center';
        slot.style.justifyContent = 'space-between';

        const hasOriginal = bill.originalAmount !== undefined && bill.originalAmount !== null;

        slot.innerHTML = `
            <div style="display:flex; align-items:center;">
                <div class="num-circle">${slotIndex + 1}</div>
                <span style="margin-left:8px; color:#c49fe8;">$${bill.amount}</span>
            </div>

            ${
                hasOriginal
                    ? `<button class="remove-bill-btn" data-tooltip="Remove Bill">✕</button>`
                    : ''
            }
        `;

        if (hasOriginal) {
            const removeBtn = slot.querySelector('.remove-bill-btn');
            removeBtn.addEventListener('click', () => {
                removeBill(bill.amount);
            });
        }

        slotIndex++;
    });




    // Render completed bills after queue
    if (Array.isArray(washer.completed)) {
        washer.completed.forEach(bill => {
            if (slotIndex >= MaxSlots) return;

            // avoid showing currentBill as completed slot (just in case)
            if (washer.currentBill) {
                if (washer.currentBill && bill.id === washer.currentBill.id) return;
            }

            const slot = slotContainer.children[slotIndex];
            slot.classList.add('completed');
            slot.innerHTML = `<div class="num-circle">${slotIndex + 1}</div>
                              <span>$${bill.amount}</span>
                              <button class="collect-btn">&#10003;</button>`;
            slot.querySelector('.collect-btn').addEventListener('click', () => {
                fetch(`https://${GetParentResourceName()}/${isWasherMode ? "collectWetBills" : "collectDryBills"}`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
                    body: JSON.stringify({ worth: bill.amount, machineName: activeWasher })
                });
            });
            slotIndex++;
        });
    }

        // --- Hide last slot if it's unused ---
    if (slotContainer.children.length > 0) {
        const lastSlot = slotContainer.children[MaxSlots - 1];
        // If the slot only has its default number circle, hide it
        if (lastSlot && lastSlot.innerHTML.trim() === `<div class="num-circle">${MaxSlots}</div>`) {
            lastSlot.style.display = "none";
        }
    }


    // Update washer status
    if (washer.isRunning) {
        washerDoor.classList.add('running');
        washerStatus.innerHTML = `
            <span class="status-text">${isWasherMode ? "Washing" : "Drying"}... ${formatTime(washer.remaining)}</span>
            <span class="status-money">$${currentWashAmountEl.textContent}</span>`;
        startStopBtn.classList.remove('start');
        startStopBtn.classList.add('stop');
        startStopBtn.innerHTML = '<i class="fa-solid fa-stop"></i> Stop';
    }
    else {
        washerDoor.classList.remove('running');
        startStopBtn.classList.remove('stop');
        startStopBtn.classList.add('start');
        startStopBtn.innerHTML = '<i class="fa-solid fa-play"></i> Start';
        if (!washer.currentBill) setStatusReady();
        else washerStatus.innerHTML = `<span class="status-text">Current bill: $${washer.currentBill.amount}</span>`;
    }
}

function addToQueue(bill) {
    if (!activeWasher) return false;
    const washer = washers[activeWasher];
    if (!washer) return false;

    // Count current + queued + completed bills
    const usedSlots =
        (washer.currentBill ? 1 : 0) +
        (Array.isArray(washer.queue) ? washer.queue.length : 0) +
        (Array.isArray(washer.completed) ? washer.completed.length : 0);

    if (usedSlots >= MaxSlots) {
        showError("Machine is full");
        return false;
    }

    // Send to server
    fetch(`https://${GetParentResourceName()}/updateMachine`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            machineName: activeWasher,
            action: 'add',
            amount: bill.amount,
            duration: bill.duration,
            beforeAmount: bill.beforeAmount
        })
    });

    return true;
}

// ------------------- Dropdown -------------------

function showBillsDropdown(bills) {
    // Remove any existing dropdown and its click listener
    if (activeDropdown) {
        activeDropdown.remove();
        document.removeEventListener('click', outsideClickHandler);
        activeDropdown = null;
        outsideClickHandler = null;
    }

    const dropdown = document.createElement('div');
    dropdown.id = 'bills-dropdown';
    dropdown.style.position = 'absolute';
    dropdown.style.background = '#111';
    dropdown.style.border = '1px solid #943ddc';
    dropdown.style.borderRadius = '8px';
    dropdown.style.padding = '4px 0';
    dropdown.style.zIndex = 1000;
    dropdown.style.minWidth = "220px";
    dropdown.style.maxHeight = "200px";
    dropdown.style.overflowY = "auto";

    const btn = document.querySelector('.add-wash-button');
    const rect = btn.getBoundingClientRect();
    dropdown.style.left = rect.right + "px";
    dropdown.style.top = rect.top + "px";

    if (bills.length === 0) {
        const empty = document.createElement('div');
        empty.textContent = isWasherMode ? "You don't have any marked bills." : "You don't have any wet bills.";
        empty.style.padding = "8px 12px";
        empty.style.color = "#666";
        empty.style.fontStyle = "italic";
        dropdown.appendChild(empty);
    } else {
        bills.forEach(bill => {
            const option = document.createElement('div');
            option.textContent = isWasherMode ? `Marked Bills: $${bill.beforeAmount} → $${bill.amount} (Wash Time: ${formatTime(bill.duration)})` : `Wet Bills: $${bill.amount} (Dry Time: ${formatTime(bill.duration)})`;
            option.style.padding = "8px 12px";
            option.style.cursor = "pointer";
            option.style.color = "#c49fe8";
            option.style.transition = "background 0.2s";

            option.addEventListener('mouseenter', () => option.style.background = "#222");
            option.addEventListener('mouseleave', () => option.style.background = "transparent");

            option.addEventListener('click', () => {
                const added = addToQueue({ amount: bill.amount, duration: bill.duration, beforeAmount: bill.beforeAmount });
                if (added) {
                    fetch(`https://${GetParentResourceName()}/${isWasherMode ? "removeBill" : "removeWetBill"}`, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
                        body: JSON.stringify({ worth: bill.beforeAmount })
                    });
                }
                dropdown.remove();
                document.removeEventListener('click', outsideClickHandler);
                activeDropdown = null;
                outsideClickHandler = null;
            });

            dropdown.appendChild(option);
        });
    }

    document.body.appendChild(dropdown);
    activeDropdown = dropdown;

    outsideClickHandler = (e) => {
        if (!dropdown.contains(e.target) && e.target !== btn) {
            dropdown.remove();
            activeDropdown = null;
            document.removeEventListener('click', outsideClickHandler);
            outsideClickHandler = null;
        }
    };

    // Delay adding listener to avoid instantly triggering
    setTimeout(() => document.addEventListener('click', outsideClickHandler), 0);
}

// ------------------- Button Handlers -------------------

document.querySelector('.add-wash-button').addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/${isWasherMode ? "getMarkedBills" : "getWetBills"}`, {
        method: 'POST',
        body: JSON.stringify({machineName: activeWasher}),
        headers: { 'Content-Type': 'application/json' }
    });
});


startStopBtn.addEventListener('click', () => {
    if (!activeWasher) return;
    const washer = washers[activeWasher];

    fetch(`https://${GetParentResourceName()}/updateMachine`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            machineName: activeWasher,
            action: washer.isRunning ? 'stop' : 'start'
        })
    });
});


// ------------------- NUI Messages -------------------

window.addEventListener('message', (event) => {
    const data = event.data;

     if (data.action === 'open') {
        MaxSlots = data.maxSlots;
        activeWasher = data.machineName;
        washers[activeWasher] = data.data;
        isWasherMode = data.isWasher; // <-- set washer/dryer mode
        container.style.display = 'block';

        // Update static texts depending on mode
        document.getElementById('queue-title').innerHTML = 
            isWasherMode 
            ? `<i class="fa-regular fa-clock"></i>Washing Queue`
            : `<i class="fa-regular fa-clock"></i>Drying Queue`;

        document.getElementById('add-wash-text').textContent = 
            isWasherMode ? "Add dirty money" : "Add wet bills";

        document.querySelector('.info-header').textContent = 
            isWasherMode ? "MoneyWash Pro" : "MoneyDry Pro";

        const statusLabel = document.querySelector('.status-label'); 
        if (statusLabel) {
            statusLabel.innerHTML = 
                isWasherMode 
                ? `<i class="fa-solid fa-dollar-sign spin"></i>Currently washing:`
                : `<i class="fa-solid fa-dollar-sign spin"></i>Currently drying:`;
        }

        washLevel.innerHTML = `Money Washing Level: ${data.level.level}`;
        destructionRate.innerHTML = `Washer Destruction Rate: ${data.level.mdr}%`

        renderWasherUI(washers[activeWasher]);
    }

    if (data.action === 'close') {
        container.style.display = 'none';
        if (activeDropdown) activeDropdown.remove();
        activeDropdown = null;
    }

     if (data.action === 'sync') {
        washers[data.machineName] = data.data;
        if (activeWasher === data.machineName) renderWasherUI(washers[activeWasher]);
    }

    if (data.action === "showMarkedBills") {
        showBillsDropdown(data.bills || []);
    }
});

// ------------------- Close NUI -------------------

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && activeWasher) {
        fetch(`https://${GetParentResourceName()}/close`, { 
            method: 'POST', 
            body: JSON.stringify({}), 
            headers: {'Content-Type':'application/json'} 
        });
        container.style.display = 'none';
        activeWasher = null;

        // Remove dropdown if open
        if (activeDropdown) {
            activeDropdown.remove();
            activeDropdown = null;
        }

        // Remove outside click handler if attached
        if (outsideClickHandler) {
            document.removeEventListener('click', outsideClickHandler);
            outsideClickHandler = null;
        }
    }
});

