const app = document.getElementById('app');
const itemList = document.getElementById('itemList');
const basketList = document.getElementById('basketList');
const quantityValue = document.getElementById('quantityValue');
const addToBasketBtn = document.getElementById('addToBasket');
const buyAllBtn = document.getElementById('buyAll');
const totalValue = document.getElementById('totalValue');
const closeBtn = document.getElementById('closeBtn');
const increaseQtyBtn = document.getElementById('increaseQty');
const decreaseQtyBtn = document.getElementById('decreaseQty');
const searchInput = document.getElementById('searchInput');
const currencyBadge = document.getElementById('currencyBadge');
const toastEl = document.getElementById('toast');

const resourceName = typeof GetParentResourceName === 'function' ? GetParentResourceName() : 'd,-blackmarket';

let items = [];
let currency = { label: 'Marked Bills', name: 'markedbills', mode: 'item' };
let selectedItem = null;
let quantity = 1;
const basket = new Map();
let filtered = [];

const send = (route, data = {}) => {
  return fetch(`https://${resourceName}/${route}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify(data)
  }).catch(() => {});
};

const formatCurrency = (value) => {
  const amount = Number(value) || 0;
  const mode = (currency?.mode || '').toLowerCase();

  if (mode === 'cash') {
    return `$${amount.toLocaleString('en-US')}`;
  }

  return amount.toLocaleString('en-US');
};

const showToast = (text) => {
  toastEl.textContent = text || 'Done';
  toastEl.classList.add('show');
  setTimeout(() => toastEl.classList.remove('show'), 1200);
};

const updateQuantity = () => { quantityValue.textContent = quantity; };

const cardHTML = (item) => {
  const img = item.image;
  const label = item.label || item.name || '';
  return `
    <img src="${img}" alt="${label}" />
    <div>
      <h3>${label}</h3>
      <div class="meta">
        <span class="price">${formatCurrency(item.price)}</span>
      </div>
    </div>
    <span class="chev">›</span>
  `;
};

const renderItems = () => {
  itemList.innerHTML = '';
  const list = filtered.length ? filtered : items;
  if (!list.length) {
    const empty = document.createElement('div');
    empty.className = 'item-card';
    empty.innerHTML = '<strong>No items found</strong>';
    itemList.appendChild(empty);
    return;
  }
  list.forEach((item) => {
    const card = document.createElement('button');
    card.type = 'button';
    card.className = 'item-card';
    card.innerHTML = cardHTML(item);

    card.addEventListener('mouseenter', () => {
      send('hover', { name: item.name, model: item.model || item.previewModel || null });
    });
    card.addEventListener('mouseleave', () => {
      send('hover', {});
    });
    card.addEventListener('click', () => {
      document.querySelectorAll('.item-card').forEach((el) => el.classList.remove('active'));
      card.classList.add('active');
      selectedItem = item;
      quantity = 1;
      updateQuantity();
    });

    if (selectedItem && selectedItem.name === item.name) card.classList.add('active');
    itemList.appendChild(card);
  });
};

const renderBasket = () => {
  basketList.innerHTML = '';
  if (!basket.size) {
    const empty = document.createElement('div');
    empty.className = 'basket-item';
    empty.innerHTML = '<span>Your basket is empty.</span>';
    basketList.appendChild(empty);
    buyAllBtn.disabled = true;
    totalValue.textContent = formatCurrency(0);
    return;
  }
  let total = 0;
  basket.forEach((entry, key) => {
    total += entry.price * entry.amount;
    const row = document.createElement('div');
    row.className = 'basket-item';
    row.innerHTML = `
      <div>
        <strong>${entry.label}</strong>
        <span>${formatCurrency(entry.price)} x ${entry.amount}</span>
      </div>
      <button type="button" data-item="${key}">Remove</button>
    `;
    row.querySelector('button').addEventListener('click', (evt) => {
      const name = evt.currentTarget.getAttribute('data-item');
      if (!basket.has(name)) return;
      const current = basket.get(name);
      if (current.amount <= 1) basket.delete(name);
      else { current.amount -= 1; basket.set(name, current); }
      renderBasket();
    });
    basketList.appendChild(row);
  });
  buyAllBtn.disabled = false;
  totalValue.textContent = `${formatCurrency(total)} (${currency.label || 'Currency'})`;
};

const applyFilter = () => {
  const q = (searchInput.value || '').trim().toLowerCase();
  if (!q) { filtered = []; renderItems(); return; }
  const list = items.slice();
  filtered = list.filter(i =>
    (i.name && i.name.toLowerCase().includes(q)) ||
    (i.label && i.label.toLowerCase().includes(q))
  );
  renderItems();
};

const resetState = () => {
  basket.clear();
  quantity = 1;
  selectedItem = items[0] || null;
  filtered = [];
  updateQuantity();
  renderItems();
  renderBasket();
};

const openUi = (data) => {
  items = Array.isArray(data.items) ? data.items : [];
  currency = data.currency || currency;
  if (!currency.mode) currency.mode = 'item';

  selectedItem = items[0] || null;
  quantity = 1;

  currencyBadge.textContent = currency.label || 'Currency';
  filtered = [];
  renderItems();
  updateQuantity();
  renderBasket();
  app.classList.remove('hidden');
  send('hover', {});
};

const closeUi = () => {
  app.classList.add('hidden');
  send('hover', {});
};

addToBasketBtn.addEventListener('click', () => {
  if (!selectedItem) return;
  const key = selectedItem.name;
  const existing = basket.get(key) || {
    name: selectedItem.name,
    label: selectedItem.label || selectedItem.name,
    price: Number(selectedItem.price) || 0,
    amount: 0
  };
  existing.amount += quantity;
  basket.set(key, existing);
  renderBasket();
});

buyAllBtn.addEventListener('click', () => {
  if (!basket.size) return;
  const payload = [];
  basket.forEach((entry) => payload.push({ name: entry.name, amount: entry.amount }));
  send('purchase', { items: payload });
});

closeBtn.addEventListener('click', () => send('close'));
increaseQtyBtn.addEventListener('click', () => { quantity = Math.min(quantity + 1, 50); updateQuantity(); });
decreaseQtyBtn.addEventListener('click', () => { quantity = Math.max(quantity - 1, 1); updateQuantity(); });
searchInput.addEventListener('input', applyFilter);

window.addEventListener('keydown', (event) => { if (event.key === 'Escape') send('close'); });

window.addEventListener('message', (event) => {
  const { action, items: payloadItems, currency: payloadCurrency } = event.data || {};
  if (action === 'open') {
    openUi({ items: payloadItems || [], currency: payloadCurrency || currency });
  } else if (action === 'close') {
    closeUi();
  } else if (action === 'purchaseSuccess') {
    resetState();
    showToast('Purchased successfully');
  }
});

closeUi();
