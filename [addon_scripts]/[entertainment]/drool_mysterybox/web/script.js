let resourceName = 'mysterybox';
let overlay = document.getElementById('overlay');
let boxtitle = document.getElementById('box-title');
let closeBtn = document.getElementById('close-btn');
let openBtn = document.getElementById('open-btn');
let itemStrip = document.getElementById('item-strip');
let originalSpinHTML = document.getElementById('spin').innerHTML;
let originalTitleText = document.getElementById('box-title').innerText;

let rewardsConfig = null;
let raritiesConfig = null;
let chosenReward = null;
let spinTimeout = null;

function resetSpinUI() {
  const spinDiv = document.getElementById('spin');
  const title = document.getElementById('box-title');
  const desc = document.getElementById('box-desc');

  spinDiv.innerHTML = originalSpinHTML;
  title.textContent = originalTitleText;
  desc.textContent = "Click open to receive your random reward!";

  itemStrip = document.getElementById('item-strip');
  openBtn = document.getElementById('open-btn');
  openBtn.style.display = 'inline-block';
  openBtn.disabled = false;
  openBtn.style.pointerEvents = 'auto';

  itemStrip.style.transition = 'none';
  itemStrip.style.transform = 'translateX(0px)';
}

function cancelSpinAndReset() {
  if (spinTimeout) {
    clearTimeout(spinTimeout);
    spinTimeout = null;
  }
  if (itemStrip) itemStrip.style.transition = 'none';
  resetSpinUI();
  overlay.style.display = 'none';
}

closeBtn.onclick = () => {
  cancelSpinAndReset();
  fetch(`https://${GetParentResourceName()}/claim`, {
    method: 'POST',
    headers: {'Content-Type':'application/json'},
    body: JSON.stringify({reward: chosenReward})
  });
  overlay.style.display = 'none';
};

document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') closeBtn.onclick();
});

window.addEventListener('message', (event) => {
  const data = event.data;
  if (!data) return;

  if (data.action === 'open') {
    resetSpinUI();
    resourceName = data.resource || resourceName;

    overlay.style.display = 'flex';
    closeBtn.style.display = 'none';

    rewardsConfig = Array.isArray(data.rewards) ? data.rewards : [];
    raritiesConfig = (data.rarities && typeof data.rarities === 'object') ? data.rarities : {};
    chosenReward = data.chosen || null;

    boxtitle.innerText = data.box || 'Mystery Box';

    if (!rewardsConfig.length || !Object.keys(raritiesConfig).length || !chosenReward) return;

    createItemList();
  }

  if (data.action === 'close') {
    overlay.style.display = 'none';
  }
});

// Weighted rarity roll
function pickWeightedRarity() {
  let roll = Math.random() * 100;
  let cumulative = 0;
  for (let r in raritiesConfig) {
    cumulative += (raritiesConfig[r]?.chance ?? 0);
    if (roll < cumulative) return r;
  }
  return 'common';
}

// Items by rarity (SAFE fallback)
function pickItemByRarity() {
  const rarity = pickWeightedRarity();
  const filtered = rewardsConfig.filter(x => x && x.rarity === rarity);

  if (filtered.length) return filtered[Math.floor(Math.random() * filtered.length)];
  if (rewardsConfig.length) return rewardsConfig[Math.floor(Math.random() * rewardsConfig.length)];
  return null;
}

function revealReward() {
  const spinDiv = document.getElementById('spin');
  const title = document.getElementById('box-title');
  const desc = document.getElementById('box-desc');

  openBtn.style.display = 'none';
  closeBtn.style.display = 'flex';

  spinDiv.innerHTML = '';

  const rewardCard = document.createElement('div');
  rewardCard.className = 'reward-card';
  rewardCard.innerText = chosenReward.displayName || chosenReward.reward;

  const color = raritiesConfig?.[chosenReward.rarity]?.color || 'ffffff';
  rewardCard.style.border = `4px solid #${color}`;

  rewardCard.style.backgroundImage = `url('https://44417-cdn.fivemsvr.com/img/${chosenReward.image}')`;
  rewardCard.style.backgroundSize = 'cover';
  rewardCard.style.backgroundPosition = 'center';
  rewardCard.style.width = '180px';
  rewardCard.style.height = '180px';
  rewardCard.style.display = 'flex';
  rewardCard.style.alignItems = 'flex-end';
  rewardCard.style.justifyContent = 'center';
  rewardCard.style.color = '#fff';
  rewardCard.style.textShadow = '0 0 5px #000';
  rewardCard.style.fontWeight = 'bold';
  rewardCard.style.borderRadius = '12px';
  rewardCard.style.margin = '0 auto';

  spinDiv.appendChild(rewardCard);

  title.textContent = `You received: ${chosenReward.displayName || chosenReward.reward}`;
  desc.textContent = `Rarity: ${chosenReward.rarity}`;
}

// Helper to decide if an item equals chosenReward (not by reference)
function isSameReward(a, b) {
  if (!a || !b) return false;
  return (
    a.reward === b.reward &&
    a.type === b.type &&
    a.amount === b.amount &&
    a.rarity === b.rarity &&
    a.image === b.image
  );
}

// Spin logic
function createItemList() {
  itemStrip.innerHTML = '';

  const spinBox = document.getElementById('spin');
  const minSpinTime = 10;
  const maxSpinTime = 15;
  const totalSpinSeconds = Math.random() * (maxSpinTime - minSpinTime) + minSpinTime;

  // Fill enough items so the strip is long (keeps your same feel)
  const pixelsPerSecond = 400;
  const totalScrollDistance = pixelsPerSecond * totalSpinSeconds;

  // Use a guess to estimate count (actual alignment is measured later)
  const itemWidthGuess = 130;
  const itemsNeeded = Math.ceil(totalScrollDistance / itemWidthGuess);

  let stripItems = [];

  // Fill random items
  for (let i = 0; i < itemsNeeded; i++) {
    const it = pickItemByRarity();
    if (it) stripItems.push(it);
  }

  // Place chosen reward near the end
  stripItems.push(chosenReward);

  // Extra items after winner
  for (let i = 0; i < 5; i++) {
    const it = pickItemByRarity();
    if (it) stripItems.push(it);
  }

  // Build DOM and tag the winner element explicitly
  let winnerTagged = false;

  stripItems.forEach((item) => {
    if (!item) return;

    const div = document.createElement('div');
    div.className = 'item';
    div.innerText = item.displayName || item.reward;

    const rarityColor = raritiesConfig?.[item.rarity]?.color || 'ffffff';
    div.style.border = `2px solid #${rarityColor}`;
    div.style.boxShadow = `0 0 10px 2px #${rarityColor}`;

    if (item.image) {
      div.style.backgroundImage = `url('https://44417-cdn.fivemsvr.com/img/${item.image}')`;
      div.style.backgroundSize = 'cover';
      div.style.backgroundPosition = 'center';
      div.style.color = '#fff';
      div.style.textShadow = '0 0 5px #000';
      div.style.fontWeight = 'bold';
      div.style.display = 'flex';
      div.style.alignItems = 'flex-end';
      div.style.justifyContent = 'center';
      div.style.paddingBottom = '5px';
    }

    // Tag the *first* match we find for chosenReward (the one we inserted)
    if (!winnerTagged && isSameReward(item, chosenReward)) {
      div.dataset.winner = '1';
      winnerTagged = true;
    }

    itemStrip.appendChild(div);
  });

  openBtn.onclick = () => {
    if (openBtn.disabled) return;
    openBtn.disabled = true;
    openBtn.style.pointerEvents = 'none';

    requestAnimationFrame(() => {
      const winnerEl = itemStrip.querySelector('[data-winner="1"]');
      if (!winnerEl) {
        // failsafe: just reveal (shouldn't happen)
        revealReward();
        return;
      }

      // Measure actual positions (includes margins/gaps/real widths)
      const spinRect = spinBox.getBoundingClientRect();
      const winnerRect = winnerEl.getBoundingClientRect();
      const stripRect = itemStrip.getBoundingClientRect();

      // Current translateX
      const currentTransform = itemStrip.style.transform || 'translateX(0px)';
      const match = currentTransform.match(/translateX\(([-0-9.]+)px\)/);
      const currentX = match ? parseFloat(match[1]) : 0;

      // Where we want the winner center to land (center of spin box)
      const targetCenterX = spinRect.left + (spinRect.width / 2);

      // Winner center currently (in screen coords)
      const winnerCenterX = winnerRect.left + (winnerRect.width / 2);

      // Delta needed to move winner center to target center
      const delta = targetCenterX - winnerCenterX;

      // Final translate
      const finalX = currentX + delta;

      itemStrip.style.transition = `transform ${totalSpinSeconds}s cubic-bezier(.05,.34,.19,1)`;
      itemStrip.style.transform = `translateX(${finalX}px)`;

      spinTimeout = setTimeout(() => {
        revealReward();
        spinTimeout = null;
      }, totalSpinSeconds * 1000);
    });
  };
}
