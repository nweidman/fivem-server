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
let spinTimeout = null; // store the setTimeout reference

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
  itemStrip.style.transform = 'translateX(0)';
}

closeBtn.onclick = () => {
  cancelSpinAndReset();
  fetch(`https://${GetParentResourceName()}/claim`, {
    method: 'POST',
    headers: {'Content-Type':'application/json'},
    body: JSON.stringify({reward: chosenReward})
  });
  overlay.style.display = 'none';
}

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
    closeBtn.style.display ='none';
    rewardsConfig = data.rewards;
    raritiesConfig = data.rarities;
    chosenReward = data.chosen;
    boxtitle.innerText = data.box;
    if (!rewardsConfig || !raritiesConfig) return;
    createItemList()
  }

  if (data.action === 'close') {
    overlay.style.display = 'none';
  }
});

// Weighted rarity roll
function getRarity() {
  let roll = Math.random() * 100;
  let cumulative = 0;
  for (let r in raritiesConfig) {
    cumulative += raritiesConfig[r].chance;
    if (roll < cumulative) return r;
  }
  return 'common';
}

// Items by rarity
function getRewardForRarity(rarity) {
  let filtered = rewardsConfig.filter(x => x.rarity === rarity);
  return filtered[Math.floor(Math.random() * filtered.length)];
}

function revealReward() {
  const spinDiv = document.getElementById('spin');
  const title = document.getElementById('box-title');
  const desc = document.getElementById('box-desc');
  openBtn.style.display = 'none';
  closeBtn.style.display ='flex';
  // Clear current spin content
  spinDiv.innerHTML = '';

  // Create reward card
  const rewardCard = document.createElement('div');
  rewardCard.className = 'reward-card';
  rewardCard.innerText = chosenReward.displayName || chosenReward.reward;
  rewardCard.style.border = `4px solid #${raritiesConfig[chosenReward.rarity].color}`;
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

  // Update title and description to show the reward
  title.textContent = `You received: ${chosenReward.displayName || chosenReward.reward}`;
  desc.textContent = `Rarity: ${chosenReward.rarity}`;
}

function pickWeightedRarity() {
    let roll = Math.random() * 100;
    let cumulative = 0;
    for (let r in raritiesConfig) {
        cumulative += raritiesConfig[r].chance;
        if (roll < cumulative) return r;
    }
    return 'common'; // fallback
}

// Pick a random item of a specific rarity
function pickItemByRarity() {
    const rarity = pickWeightedRarity();
    const filtered = rewardsConfig.filter(x => x.rarity === rarity);
    return filtered[Math.floor(Math.random() * filtered.length)];
}

// Spin logic
function createItemList(){
  itemStrip.innerHTML = '';

    const spinBoxWidth = document.getElementById('spin').offsetWidth;
    const itemWidth = 150; // match CSS width
    const minSpinTime = 10;
    const maxSpinTime = 15;
    const totalSpinSeconds = Math.random() * (maxSpinTime - minSpinTime) + minSpinTime;
    const pixelsPerSecond = 400;
    const totalScrollDistance = pixelsPerSecond * totalSpinSeconds;

    const itemsNeeded = Math.ceil(totalScrollDistance / itemWidth);

    let baseItems = [];
    const preItems = [];

    for (let i = 0; i < 10; i++) {
      preItems.push(pickItemByRarity());
    }
    baseItems = [...preItems];

    for (let i = 0; i < itemsNeeded; i++) {
      baseItems.push(pickItemByRarity());
    }

    baseItems.push(chosenReward);
    let chosenIndexInBase = baseItems.length - 1;

    for (let i = 0; i < 5; i++) {
      baseItems.push(pickItemByRarity());
    }

    for (let i = 0; i < 10; i++) {
      baseItems.push(preItems[i]);
    }

    const itemsPerLoop = baseItems.length;
    const loopsNeeded = Math.ceil(totalScrollDistance / (itemsPerLoop * itemWidth)) + 3;
    const numDuplicates = Math.max(10, loopsNeeded * 2); // Double it to have middle point
    let stripItems = [];
    for (let i = 0; i < numDuplicates; i++) {
      stripItems = stripItems.concat(baseItems);
    }

    const itemsToScroll = Math.ceil(totalScrollDistance / itemWidth);
    const targetLoop = Math.floor(itemsToScroll / itemsPerLoop);

    const targetLoopIndex = Math.max(2, Math.min(targetLoop + 1, Math.floor(numDuplicates / 2) - 1));
    const chosenIndex = (targetLoopIndex * itemsPerLoop) + chosenIndexInBase;

    stripItems.forEach((item, index) => {
      const div = document.createElement('div');
      div.className = 'item';
      div.innerText = item.displayName || item.reward;
      div.style.border = `2px solid #${raritiesConfig[item.rarity].color}`;
      div.style.boxShadow = `0 0 10px 2px #${raritiesConfig[item.rarity].color}`;

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

      itemStrip.appendChild(div);
    });
    openBtn.onclick = () => {
      if (openBtn.disabled) return; // prevent spamming
      openBtn.disabled = true;      // disable immediately
      openBtn.style.pointerEvents = 'none'; // optional: prevent extra clicks

      requestAnimationFrame(() => {
        const allItems = itemStrip.querySelectorAll('.item');
        const firstItem = allItems[0];
        const actualItemWidth = firstItem.getBoundingClientRect().width;

        let finalChosenIndex = chosenIndex;
        if (finalChosenIndex >= allItems.length) {
          finalChosenIndex = allItems.length - 1;
          for (let i = allItems.length - 1; i >= 0; i--) {
            const itemText = allItems[i].innerText;
            if (itemText === (chosenReward.displayName || chosenReward.reward)) {
              finalChosenIndex = i;
              break;
            }
          }
        }

        const centerStop = (spinBoxWidth / 2) - (actualItemWidth / 2);
        const finalX = -(finalChosenIndex * actualItemWidth) + centerStop;
        const startX = finalX + totalScrollDistance;

        itemStrip.style.transition = 'none';
        itemStrip.style.transform = `translateX(${startX}px)`;

        void itemStrip.offsetWidth;
        itemStrip.style.transition = `transform ${totalSpinSeconds}s cubic-bezier(.05,.34,.19,1)`;
        itemStrip.style.transform = `translateX(${finalX}px)`;

        spinTimeout = setTimeout(() => {
          revealReward();
          spinTimeout = null; 
        }, totalSpinSeconds * 1000);
      });
    };
}

function cancelSpinAndReset() {
    if (spinTimeout) {
        clearTimeout(spinTimeout);
        spinTimeout = null;
    }
    itemStrip.style.transition = 'none';
    resetSpinUI();
    
    overlay.style.display = 'none';
}
