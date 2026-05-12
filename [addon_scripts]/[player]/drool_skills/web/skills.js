const container = document.getElementById('skills-ui');
const categoriesContainer = document.querySelector('.skills-categories');
const infoContainer = document.querySelector('.skills-info');
const pointsContainer = document.getElementById('points');

let Skills = null;
let playerSkills = null;
let skillPoints = null;
let selectedSkillKey = null; // store skill key, not DOM element
let currentlyOpenTier = null;

window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.action === 'open' || data.action === 'update') {
        container.style.display = 'block';
        Skills = data.skills;
        playerSkills = data.data;
        skillPoints = playerSkills.perkpoints;
        populateCategories();
    }
    if (data.action === 'close') {
        container.style.display = 'none';
    }
});

// ------------------- Close NUI -------------------
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        fetch(`https://${GetParentResourceName()}/closeUI`, { 
            method: 'POST', 
            body: JSON.stringify({}), 
            headers: {'Content-Type':'application/json'} 
        });
        container.style.display = 'none';
    }
});

// ------------------- Populate Categories -------------------
function populateCategories() {
    categoriesContainer.innerHTML = "<h3>Skill Categories</h3>"; // reset
    pointsContainer.innerHTML = `${skillPoints}`;

    const sortedCategories = Object.keys(Skills).sort((a, b) =>
        a.localeCompare(b)
    );

    sortedCategories.forEach((categoryName) => {
        const skill = Skills[categoryName];

        const div = document.createElement('div');
        div.classList.add('category-box');
        div.style.cursor = 'pointer';
        div.style.padding = '15px';
        div.style.margin = '10px 0';
        div.style.borderRadius = '10px';
        div.style.background = '#2d3748';

        div.innerHTML = `
            <div style="display:flex; align-items:center;">
                <span style="font-size:1.5em; margin-right:10px;">${skill.icon}</span>
                <div style="display:flex; flex-direction:column;">
                    <span>${categoryName}</span>
                    <span style="font-size:0.7em; color:#cbd5e0; margin-top:4px;">
                        Level ${playerSkills?.levels?.[skill.key]?.tier || 0} / 5
                    </span>
                </div>
            </div>
        `;

        div.addEventListener('click', () => {
            selectedSkillKey = skill.key; // save key
            setActiveCategory(div);
            showSkillInfo(categoryName);
        });

        categoriesContainer.appendChild(div);

        // ✅ Auto-select the previously selected skill
        if (selectedSkillKey === skill.key) {
            setActiveCategory(div);
            showSkillInfo(categoryName);
        }
    });

    // ✅ If nothing is selected, default to first
    if (!selectedSkillKey && sortedCategories.length > 0) {
        selectedSkillKey = Skills[sortedCategories[0]].key;
        const firstBox = categoriesContainer.querySelector('.category-box');
        if (firstBox) {
            setActiveCategory(firstBox);
            showSkillInfo(sortedCategories[0]);
        }
    }
}

// ------------------- Helper: Highlight selected -------------------
function setActiveCategory(selectedDiv) {
    document.querySelectorAll('.category-box').forEach(box => {
        box.classList.remove('active');
    });
    selectedDiv.classList.add('active');
}

// ------------------- Alert -------------------
function showAlert(message, isError, onConfirm) {
    // Create overlay
    const overlay = document.createElement('div');
    overlay.style.position = 'fixed';
    overlay.style.top = '0';
    overlay.style.left = '0';
    overlay.style.width = '100%';
    overlay.style.height = '100%';
    overlay.style.background = 'rgba(0,0,0,0.5)';
    overlay.style.zIndex = '9998';
    document.body.appendChild(overlay);

    // Create alert box
    const alertBox = document.createElement('div');
    alertBox.style.position = 'fixed';
    alertBox.style.top = '50%';
    alertBox.style.left = '50%';
    alertBox.style.transform = 'translate(-50%, -50%)';
    alertBox.style.background = '#1f2937';
    alertBox.style.color = 'white';
    alertBox.style.padding = '20px 30px';
    alertBox.style.borderRadius = '8px';
    alertBox.style.border = '2px solid white';
    alertBox.style.boxShadow = '0 4px 10px rgba(0,0,0,0.3)';
    alertBox.style.zIndex = '9999';
    alertBox.style.display = 'flex';
    alertBox.style.flexDirection = 'column';
    alertBox.style.alignItems = 'center';
    alertBox.style.gap = '15px';

    // Message text
    const msg = document.createElement('div');
    msg.textContent = message;
    alertBox.appendChild(msg);

    if (isError) {
        // Error: only Close button
        const closeBtn = document.createElement('button');
        closeBtn.textContent = 'Close';
        closeBtn.style.background = '#dc2626';
        closeBtn.style.color = 'white';
        closeBtn.style.border = 'none';
        closeBtn.style.padding = '8px 16px';
        closeBtn.style.borderRadius = '6px';
        closeBtn.style.cursor = 'pointer';
        closeBtn.addEventListener('click', () => {
            document.body.removeChild(alertBox);
            document.body.removeChild(overlay);
        });
        alertBox.appendChild(closeBtn);
    } else {
        // Confirmation: Cancel + Confirm buttons
        const buttonsRow = document.createElement('div');
        buttonsRow.style.display = 'flex';
        buttonsRow.style.gap = '10px';

        const cancelBtn = document.createElement('button');
        cancelBtn.textContent = 'Cancel';
        cancelBtn.style.background = '#6b7280';
        cancelBtn.style.color = 'white';
        cancelBtn.style.border = 'none';
        cancelBtn.style.padding = '8px 16px';
        cancelBtn.style.borderRadius = '6px';
        cancelBtn.style.cursor = 'pointer';
        cancelBtn.addEventListener('click', () => {
            document.body.removeChild(alertBox);
            document.body.removeChild(overlay);
        });

        const confirmBtn = document.createElement('button');
        confirmBtn.textContent = 'Confirm';
        confirmBtn.style.background = '#2563eb';
        confirmBtn.style.color = 'white';
        confirmBtn.style.border = 'none';
        confirmBtn.style.padding = '8px 16px';
        confirmBtn.style.borderRadius = '6px';
        confirmBtn.style.cursor = 'pointer';
        confirmBtn.addEventListener('click', () => {
            if (onConfirm) onConfirm(); // call optional confirm callback
            document.body.removeChild(alertBox);
            document.body.removeChild(overlay);
            fetch(`https://${GetParentResourceName()}/resetSkillPoints`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            });
        });

        buttonsRow.appendChild(cancelBtn);
        buttonsRow.appendChild(confirmBtn);
        alertBox.appendChild(buttonsRow);
    }

    document.body.appendChild(alertBox);
}



// ------------------- Show Skill Info -------------------
function showSkillInfo(categoryName) {
    const skill = Skills[categoryName];
    if (!skill) return;

    // Reset currently open tier on each refresh
    currentlyOpenTier = null;

    infoContainer.innerHTML = `
        <div style="padding:15px;">
            <h2 style="margin:0 0 20px 0; font-size:18px;">${skill.icon} ${categoryName}</h2>
            <div id="tiers"></div>
        </div>
    `;

    const tiersDiv = infoContainer.querySelector('#tiers');

    skill.tiers.forEach((tier, index) => {
        const currentTier = playerSkills?.levels?.[skill.key]?.tier || 0;
        const tierNumber = index + 1;

        let borderColor = "#4b5563"; // grey default
        let prefixIcon = "lock.png";
        let descBottomContent = null;
        let statusText = "Locked";
        let statusColor = "#4b5563";

        if (tierNumber <= currentTier) {
            borderColor = "#22c55e";
            prefixIcon = "check-mark.png";
            descBottomContent = { text: "✓ Skill Mastered", isButton: false };
            statusText = "Mastered";
            statusColor = "#22c55e";
        } else if (tierNumber === currentTier + 1) {
            borderColor = "#facc15";
            prefixIcon = "star.png";
            descBottomContent = { text: `Required: ${tier.cost} skill points`, isButton: true };
            statusText = "Available";
            statusColor = "#facc15";
        } else {
            borderColor = "#394351";
            prefixIcon = "lock.png";
            descBottomContent = { text: "🔒 Complete previous tier to unlock", isButton: false };
            statusText = "Locked";
            statusColor = "#394351";
        }

        const tierDiv = document.createElement('div');
        tierDiv.style.borderRadius = '8px';
        tierDiv.style.marginBottom = '10px';
        tierDiv.style.fontFamily = 'sans-serif';
        tierDiv.style.cursor = 'pointer';
        tierDiv.style.display = 'flex';
        tierDiv.style.flexDirection = 'column';

        const tierButton = document.createElement('div');
        tierButton.style.display = 'flex';
        tierButton.style.alignItems = 'center';
        tierButton.style.justifyContent = 'space-between';
        tierButton.style.padding = '20px';
        tierButton.style.border = `2px solid ${borderColor}`;
        tierButton.style.borderRadius = '8px';
        tierButton.style.background = '#1f2937';
        tierButton.dataset.originalBg = tierButton.style.background;
        tierButton.dataset.originalBdr = tierButton.style.border;

        const leftSide = document.createElement('div');
        leftSide.style.display = 'flex';
        leftSide.style.alignItems = 'center';

        const iconDiv = document.createElement('div');
        iconDiv.style.marginRight = '12px';
        const img = document.createElement("img");
        img.src = prefixIcon;
        img.alt = "icon";
        img.style.width = "20px";
        img.style.height = "20px";
        iconDiv.appendChild(img);

        const textDiv = document.createElement('div');
        textDiv.style.display = 'flex';
        textDiv.style.flexDirection = 'column';
        textDiv.style.gap = '4px';
        textDiv.style.color = (statusText === "Locked") ? "#868c96" : "white";

        textDiv.innerHTML = `
            <span style="font-size:1.15em; font-family: Tahoma, sans-serif; font-weight:500;">
                Tier ${tierNumber}: ${tier.name}
            </span>
            <span style="font-size:0.85em; color:#9ca3af; margin-top:2px;">
                Cost: ${tier.cost} skill points
            </span>
        `;

        leftSide.appendChild(iconDiv);
        leftSide.appendChild(textDiv);

        const statusBadge = document.createElement('div');
        statusBadge.textContent = statusText;
        statusBadge.style.background = statusColor;
        statusBadge.style.color = (statusText === "Locked") ? "#868c96" : "white";
        statusBadge.style.borderRadius = '20px';
        statusBadge.style.padding = '4px 12px';
        statusBadge.style.fontSize = '0.8em';
        statusBadge.style.whiteSpace = 'nowrap';

        tierButton.appendChild(leftSide);
        tierButton.appendChild(statusBadge);

        const descDiv = document.createElement('div');
        descDiv.style.background = '#374151';
        descDiv.style.borderRadius = '8px';
        descDiv.style.padding = '15px';
        descDiv.style.marginTop = '5px';
        descDiv.style.display = 'none';
        descDiv.style.flexDirection = 'column';
        descDiv.style.justifyContent = 'space-between';

        const descText = document.createElement('p');
        descText.textContent = tier.description;
        descText.style.margin = '0 0 10px 0';
        descText.style.color = '#cbd5e0';
        descDiv.appendChild(descText);

        const bottomRow = document.createElement('div');
        bottomRow.style.display = 'flex';
        bottomRow.style.justifyContent = 'space-between';
        bottomRow.style.alignItems = 'center';

        const reqText = document.createElement('span');
        reqText.textContent = descBottomContent.text;
        reqText.style.color = (descBottomContent.text === "✓ Skill Mastered") ? '#22c55e' : '#cbd5e0';
        reqText.style.fontSize = '0.9rem';
        bottomRow.appendChild(reqText);

        if (descBottomContent.isButton) {
            const levelUpBtn = document.createElement('button');
            levelUpBtn.textContent = 'Level Up';
            levelUpBtn.style.background = '#2563eb';
            levelUpBtn.style.border = 'none';
            levelUpBtn.style.borderRadius = '6px';
            levelUpBtn.style.padding = '6px 12px';
            levelUpBtn.style.color = '#fff';
            levelUpBtn.style.cursor = 'pointer';

            levelUpBtn.addEventListener('click', async (e) => {
                e.stopPropagation();

                if (levelUpBtn.disabled) return;
                levelUpBtn.disabled = true;
                levelUpBtn.style.opacity = '0.6';
                levelUpBtn.style.cursor = 'not-allowed';

                if (skillPoints < tier.cost) {
                    showAlert("❌ Not enough skill points!", true);
                    levelUpBtn.disabled = false;
                    levelUpBtn.style.opacity = '1';
                    levelUpBtn.style.cursor = 'pointer';
                    return;
                }

                try {
                    const response = await fetch(`https://${GetParentResourceName()}/levelUpTier`, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({
                            key: skill.key,
                            tier: tierNumber,
                            cost: tier.cost
                        })
                    });

                    // if (!response.ok) {
                    //     showAlert("⚠️ Something went wrong while leveling up.", true);
                    //     levelUpBtn.disabled = false;
                    //     levelUpBtn.style.opacity = '1';
                    //     levelUpBtn.style.cursor = 'pointer';
                    //     return;
                    // }

                    // Update skill points immediately
                    skillPoints -= tier.cost;
                    pointsContainer.innerHTML = `${skillPoints}`;

                } catch (err) {
                    // console.error(err);
                    // showAlert("⚠️ Error connecting to server.", true);
                    // levelUpBtn.disabled = false;
                    // levelUpBtn.style.opacity = '1';
                    // levelUpBtn.style.cursor = 'pointer';
                }
            });

            bottomRow.appendChild(levelUpBtn);
        }

        descDiv.appendChild(bottomRow);

        // ---------------- Click logic ----------------
        tierButton.addEventListener('click', () => {
            if (currentlyOpenTier && currentlyOpenTier !== tierButton) {
                currentlyOpenTier.nextElementSibling.style.display = 'none';
                currentlyOpenTier.style.background = currentlyOpenTier.dataset.originalBg;
                currentlyOpenTier.style.border = currentlyOpenTier.dataset.originalBdr;
            }

            if (descDiv.style.display === 'none') {
                descDiv.style.display = 'flex';
                tierButton.style.background = '#374151';
                tierButton.style.border = '2px solid #3b82f6';
                currentlyOpenTier = tierButton;
            } else {
                descDiv.style.display = 'none';
                tierButton.style.background = tierButton.dataset.originalBg;
                tierButton.style.border = tierButton.dataset.originalBdr;
                currentlyOpenTier = null;
            }
        });

        tierDiv.appendChild(tierButton);
        tierDiv.appendChild(descDiv);
        tiersDiv.appendChild(tierDiv);
    });
}


const resetBtn = document.getElementById('resetPointsBtn');
resetBtn.addEventListener('click', () => {  
  showAlert("Are you sure you want to reset your skills for $50,000?", false);
});
