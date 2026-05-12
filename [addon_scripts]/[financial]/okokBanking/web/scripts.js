var playerData = {};
var societyData = {};
var businessCardsData = null;

var activeLoans = [];
var playerBills = [];
var societyBills = [];
var playerTransactions = [];
var societyTransactions = [];
var loansConfig = {
  accountsWithLoans: false,
  loanPlans: [],
  creditScoreEnabled: false,
  creditScoreInfo: '',
  maxLoans: 0,
  loanMaxBankMultiplier: 1
};
var creditScoreConfig = {};
var cardsConfig = {};
var customAccountsConfig = {};
var maxActiveGoals = 3;
var businessMaxActiveGoals = 5;
var customMaxActiveGoals = 5;
var ibanChangeCost = 5000;
var pinChangeCost = 1000;
var newAccountCost = 10000;
const vatPercent = 23;
var printReceiptPrice = 100;
var maxTransferContactsFavorites = 3;

var currentPage = '';
var isClosing = false;
var isBankOpen = false;
var isInitialBankOpen = false;
var pendingChartAnimation = null;
var playedChartAnimations = {};
var lastRenderedSavingsAccount = null;
var previousChartPoints = null;
var previousSavingsChartPoints = null;
var useBilling = false;
var isATMMode = false;
var onATMSelectAccount = false;
var isReceiptOpen = false;
var atmCardOwnerCitizenId = null;
var atmCardOwnerBalance = null;
var isChangingAccount = false;
var inventoryWithMetadata = true;

var currentAccountType = 'personal';
var previousAccountType = 'personal';
var openedAccount = 'personal';
var currentCurrency = 'EUR';
var localeStrings = {};
var currentTransferRecipientType = 'external';

var selectedPin = '';


var selectedCardIndex = -1;
var selectedCardType = null;
var accountSelectionCards = [];


const CARD_SLIDE_ANIMATION_SPEED = 200;


document.documentElement.style.setProperty('--card-slide-animation-speed', `${CARD_SLIDE_ANIMATION_SPEED}ms`);


const accounts = {};
let customAccountsData = [];
let customAccountCardsData = {};


let cachedSavingsGoals = {};


let cachedActiveLoans = {};


const _L = (key) => {
  return localeStrings[key] || key;
};


const _LF = (key, ...args) => {
  var text = localeStrings[key] || key;


  args.forEach((arg, index) => {
    text = text.replace(/%[ds]/, arg);
  });

  return text;
};


const _LN = (key, replacements) => {
  var text = localeStrings[key] || key;


  if (replacements) {
    Object.keys(replacements).forEach((placeholder) => {
      text = text.replace(new RegExp(`\\{${placeholder}\\}`, 'g'), replacements[placeholder]);
    });
  }

  return text;
};


function updateLoansTabVisibility(accountType) {
  const loansNavItem = $('#navbar-items .nav-item.loans');
  if (!loansNavItem.length) return;


  let configKey = accountType;
  if (accountType && accountType.startsWith('custom_')) {
    configKey = 'custom';
  }


  const accountsWithLoans = loansConfig.accountsWithLoans || {};
  const hasLoans = accountsWithLoans[configKey] === true;

  if (hasLoans) {
    loansNavItem.show();
  } else {
    loansNavItem.hide();

    if (currentPage === 'loans') {
      switchPage('overview');
    }
  }
}

var customTooltip = null;
var customTooltipTimeout = null;
var customTooltipElement = null;

function showCustomTooltip(element, text) {

  if (customTooltipTimeout) {
    clearTimeout(customTooltipTimeout);
    customTooltipTimeout = null;
  }


  if (customTooltip && customTooltip.parentNode) {
    customTooltip.parentNode.removeChild(customTooltip);
    customTooltip = null;
    customTooltipElement = null;
  }


  customTooltip = document.createElement('div');
  customTooltip.textContent = text;
  customTooltip.className = 'custom-tooltip';


  document.body.appendChild(customTooltip);
  customTooltipElement = element;


  updateCustomTooltipPosition(element);


  setTimeout(() => {
    if (customTooltip) {
      customTooltip.style.opacity = '1';
      customTooltip.style.transform = 'translateY(0)';
    }
  }, 10);
}

function hideCustomTooltip() {
  if (customTooltipTimeout) {
    clearTimeout(customTooltipTimeout);
    customTooltipTimeout = null;
  }

  if (customTooltip) {
    customTooltip.style.opacity = '0';
    customTooltip.style.transform = 'translateY(0.25rem)';

    customTooltipTimeout = setTimeout(() => {
      if (customTooltip && customTooltip.parentNode) {
        customTooltip.parentNode.removeChild(customTooltip);
        customTooltip = null;
        customTooltipElement = null;
      }
      customTooltipTimeout = null;
    }, 200);
  }
}


function updateCustomTooltipText(element, newText) {

  if (customTooltip && customTooltipElement === element && customTooltip.parentNode) {
    customTooltip.textContent = newText;

    updateCustomTooltipPosition(element);
  }
}

function updateCustomTooltipPosition(element) {
  if (!customTooltip) return;

  requestAnimationFrame(() => {
    const tooltipRect = customTooltip.getBoundingClientRect();
    const elementRect = element.getBoundingClientRect();


    var tooltipX = elementRect.left + elementRect.width / 2 - tooltipRect.width / 2;
    var tooltipY = elementRect.top - tooltipRect.height - 10;


    const padding = 10;
    if (tooltipX < padding) {
      tooltipX = padding;
    } else if (tooltipX + tooltipRect.width > window.innerWidth - padding) {
      tooltipX = window.innerWidth - tooltipRect.width - padding;
    }

    if (tooltipY < padding) {
      tooltipY = elementRect.bottom + 10;
    }

    customTooltip.style.left = tooltipX + 'px';
    customTooltip.style.top = tooltipY + 'px';
  });
}


document.addEventListener('DOMContentLoaded', function () {
  const tooltipElements = document.querySelectorAll('[title]');

  tooltipElements.forEach(element => {
    const originalTitle = element.getAttribute('title');
    element.removeAttribute('title');
    element.setAttribute('data-tooltip', originalTitle);

    element.addEventListener('mouseenter', function () {
      const tooltipText = this.getAttribute('data-tooltip');
      if (tooltipText) {
        showCustomTooltip(this, tooltipText);
      }
    });

    element.addEventListener('mouseleave', function () {
      hideCustomTooltip();
    });
  });


  const observer = new MutationObserver(function (mutations) {
    mutations.forEach(function (mutation) {
      mutation.addedNodes.forEach(function (node) {
        if (node.nodeType === 1) {

          if (node.hasAttribute && node.hasAttribute('title')) {
            const originalTitle = node.getAttribute('title');
            node.removeAttribute('title');
            node.setAttribute('data-tooltip', originalTitle);

            node.addEventListener('mouseenter', function () {
              const tooltipText = this.getAttribute('data-tooltip');
              if (tooltipText) {
                showCustomTooltip(this, tooltipText);
              }
            });

            node.addEventListener('mouseleave', function () {
              hideCustomTooltip();
            });
          }


          const childrenWithTitle = node.querySelectorAll('[title]');
          childrenWithTitle.forEach(child => {
            const originalTitle = child.getAttribute('title');
            child.removeAttribute('title');
            child.setAttribute('data-tooltip', originalTitle);

            child.addEventListener('mouseenter', function () {
              const tooltipText = this.getAttribute('data-tooltip');
              if (tooltipText) {
                showCustomTooltip(this, tooltipText);
              }
            });

            child.addEventListener('mouseleave', function () {
              hideCustomTooltip();
            });
          });
        }
      });
    });
  });

  observer.observe(document.body, {
    childList: true,
    subtree: true
  });
});

const PageTemplates = {
  overview: () => `
    <div class="page"><span class="page-title">${_L('ui_overview')}</span></div>
    <div class="page-info">
      <div class="column column-overview-left">
        <div class="item item-summary">
          <div class="item-header"><div class="item-title">${_L('ui_summary')}</div></div>
          <div class="item-body ib-s">
            <div class="balance-actions">
              <div class="balance-div">
                <div class="balance-value"></div>
                <div class="balance-label">${_L('ui_balance')}</div>
              </div>
              <div class="balance-buttons">
                <div id="depositButton" class="btn-blue btn-bal" data-page="overview">${_L('ui_deposit')}</div>
                <div id="withdrawButton" class="btn-blue btn-bal" data-page="overview">${_L('ui_withdraw')}</div>
                <div id="transferButton" class="btn-blue btn-bal" data-page="overview">${_L('ui_transfer')}</div>
              </div>
            </div>

            <div class="chart">
              <svg id="balanceChart" viewBox="0 0 400 150" preserveAspectRatio="xMidYMid meet">
                <defs>
                  <linearGradient id="areaGradient" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" style="stop-color:#1f5eff;stop-opacity:0.3"/>
                    <stop offset="100%" style="stop-color:#1f5eff;stop-opacity:0.05"/>
                  </linearGradient>
                </defs>
                <path id="areaPath" fill="url(#areaGradient)" />
                <path id="linePath" fill="none" stroke="#1f5eff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" />
                <g id="pointsGroup"></g>
              </svg>
              <div class="chart-labels" id="chartLabels"></div>
            </div>
          </div>
        </div>

        <div class="item item-last-transactions">
          <div class="item-header">
            <div class="item-title">${_L('ui_recent_transactions')}</div>
            <div class="text-btn-header view-transactions">${_L('ui_view_all')}</div>
          </div>
          <div class="item-body ib-lt" id="lastTransactionsContainer">
            <div class="lt-noinfo">
              <i class="fa-solid fa-receipt"></i>
              <div class="cni-ft">${_L('ui_no_transactions_yet')}</div>
              <div class="cni-lt">${_L('ui_transaction_history_help')}</div>
            </div>
          </div>
        </div>
      </div>

      <div class="column column-overview-right">
        <div class="item item-cards">
          <div class="item-header">
            <div class="item-title">${_L('ui_cards')}</div>
            <div id="createNewCardButton" class="text-btn-header">${_L('ui_new')}</div>
          </div>
          <div class="item-body ib-c">
            <div class="card-div">
              <div class="credit-card">
                <div class="cc-top">
                  <div class="cc-status pending" id="cc-status">${_L('ui_pending')}</div>
                  <div class="cc-nfc"><i class="bi bi-wifi"></i></div>
                </div>
                <div class="cc-number">●●●● ●●●● ●●●● ●●●●</div>
                <div class="cc-bottom">
                  <div class="cc-holder">
                    <div class="cc-holder-label">${_L('ui_card_holder')}</div>
                    <div class="cc-holder-name">${_L('ui_change_name')}</div>
                  </div>
                  <div class="cc-exp">
                    <div class="cc-exp-label">${_L('ui_expires')}</div>
                    <div class="cc-exp-date">--/--</div>
                  </div>
                </div>
              </div>
              <div class="card-dots"></div>
            </div>

            <div class="card-options">
              <div class="card-option">
                <div class="card-info-div"><div class="card-info-label">${_L('ui_status')}:&nbsp;</div><div class="card-info-value card-status ci-pending">${_L('ui_pending')}</div></div>
                <div class="card-buttons"><div id="manageCardButton" class="card-button" title="${_L('ui_manage')}"><i class="fa-solid fa-gear"></i></div></div>
              </div>
              <div class="card-option">
                <div class="card-info-div"><div class="card-info-label">${_L('ui_pin')}:&nbsp;</div><div class="card-info-value ci-pin pin-value">${_L('ui_not_set')}</div></div>
                <div class="card-buttons">
                  <div class="card-button show-pin" title="${_L('ui_show')}"><i class="fa-solid fa-eye pin-icon"></i></div>
                  <div class="card-button edit-pin" title="${_L('ui_edit')}"><i class="fa-solid fa-pencil"></i></div>
                </div>
              </div>
              <div class="card-option">
                <div class="card-info-div"><div class="card-info-label">${_L('ui_daily_limit')}:&nbsp;</div><div class="card-info-limit">
                  <div class="card-info-value card-daily-limit">0€</div>&nbsp;<div class="card-limit-left">(0€)</div>
              </div></div>
                <div class="card-buttons card-button-daily-limit" id="card-button-daily-limit"><div class="card-button" title="${_L('ui_edit')}"><i class="fa-solid fa-pencil"></i></div></div>
              </div>
            </div>
          </div>
        </div>

        <div class="item item-management">
          <div class="item-header"><div class="item-title">${_L('ui_management')}</div></div>
          <div class="item-body ib-m">
            <div class="card-option">
              <div class="card-info-div"><div class="card-info-label">${_L('ui_iban')}:&nbsp;</div><div class="card-info-value iban" id="iban-value"></div></div>
              <div class="card-buttons">
                <div class="card-button copy-iban" title="${_L('ui_copy')}"><i class="fa-solid fa-copy"></i></div>
                <div class="card-button edit-iban" title="${_L('ui_edit')}"><i class="fa-solid fa-pencil"></i></div>
              </div>
            </div>
            <div class="card-option">
              <div class="card-info-div"><div class="card-info-label">${_L('ui_account_users')}:&nbsp;</div><div class="card-info-value users">${_LF('ui_users_count', 1, _L('ui_user'))}</div></div>
              <div class="card-buttons"><div class="card-button account-users-button" id="accountUsersButton" title="${_L('ui_manage')}"><i class="fa-solid fa-user-plus"></i></div></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  `,

  loans: () => `
    <div class="page">
        <span class="page-title">${_L('ui_loans')}</span>
    </div>
    <div class="page-info">
        <div class="column column-loans-left">
            <div class="item item-loan-plans">
                <div class="item-header">
                    <div class="item-title">${_L('ui_loan_plans')}</div>
                </div>
                <div class="item-body ib-loans">
                    <div class="loan-plans">
                    </div>
                    <div class="custom-loan">
                        <div class="loan-plan-title">${_L('ui_custom_loan')} <span class="loan-badge">${_L('ui_higher_rates')}</span></div>
                        <div class="custom-loan-body">
                            <div class="custom-loan-form">
                                <div class="custom-loan-amount">
                                    <div class="cl-label">${_L('ui_amount')}</div>
                                    <input type="text" id="customLoanAmount" class="form-input fi-loan" placeholder="${_L('ui_enter_amount')}" onkeypress="return (event.charCode >= 48 && event.charCode <= 57)" onpaste="event.preventDefault(); this.value = (event.clipboardData.getData('text')).replace(/[^0-9]/g, '')">
                                </div>
                                <div class="custom-loan-term">
                                    <div class="cl-label">${_L('ui_term')}</div>
                                    <div class="custom-select-container">
                                        <div class="custom-select-current loan-term-select" onclick="toggleLoanTermSelect(this)">
                                            <span class="custom-select-text">${_L('ui_select_term')}</span>
                                            <i class="fa-solid fa-chevron-down custom-select-arrow"></i>
                                        </div>
                                        <div class="custom-select-menu">
                                            <div class="custom-select-option" onclick="selectCustomOption(this, '12')">
                                                <span>12 ${_L('ui_days')}</span>
                                                <i class="fa-solid fa-check option-check"></i>
                                            </div>
                                            <div class="custom-select-option" onclick="selectCustomOption(this, '24')">
                                                <span>24 ${_L('ui_days')}</span>
                                                <i class="fa-solid fa-check option-check"></i>
                                            </div>
                                            <div class="custom-select-option" onclick="selectCustomOption(this, '36')">
                                                <span>36 ${_L('ui_days')}</span>
                                                <i class="fa-solid fa-check option-check"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="custom-loan-result">
                                <div class="cl-result-option">
                                    <div class="cl-ro-label">${_L('ui_amount')}</div>
                                    <div class="cl-ro-value">5.000€</div>
                                </div>
                                <div class="cl-result-option">
                                    <div class="cl-ro-label">${_L('ui_term')}</div>
                                    <div class="cl-ro-value">12 ${_L('ui_days')}</div>
                                </div>
                                <div class="cl-result-option">
                                    <div class="cl-ro-label">${_L('ui_interest_rate')}</div>
                                    <div class="cl-ro-value">5.5%</div>
                                </div>
                                <div class="cl-result-option">
                                    <div class="cl-ro-label">${_L('ui_daily_payment')}</div>
                                    <div class="cl-ro-value cb">220€</div>
                                </div>
                                <div class="btn-blue btn-rql">${_L('ui_request_loan')}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="column column-loans-right">
            <div class="item item-credit-score">
                <div class="item-header">
                    <div class="item-title">${_L('ui_credit_score')}</div>
                </div>
                <div class="item-body">
                    <div id="creditScoreButton" class="credit-score-info-btn" title="View Ranks">
                        <i class="fa-solid fa-info-circle"></i>
                    </div>
                    <div class="credit-score-chart">
                        <div class="circular-progress" id="creditScoreChart">
                            <div class="circular-progress-inner">
                                <div class="credit-score-value">742</div>
                                <div class="credit-score-label">${_L('ui_good')}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item item-active-loans">
                <div class="item-header">
                    <div class="item-title">${_L('ui_active_loans')}</div>
                </div>
                <div class="item-body ib-al pr-0375">
                    <div class="active-loans-list">
                    </div>
                </div>
            </div>
        </div>
    </div>
  `,

  transactions: () => `
    <div class="page">
      <span class="page-title">${_L('ui_transactions')}</span>
      <div class="transactions-buttons">
        <input type="text" id="transactionsSearch" class="search-input" placeholder="${_L('ui_search')}">
        <div class="custom-select-container w13">
          <div class="custom-select-current csc3" onclick="toggleCustomSelect(this)">
            <span class="custom-select-text">${_L('ui_all_accounts')}</span>
            <i class="fa-solid fa-chevron-down custom-select-arrow"></i>
          </div>
          <div class="custom-select-menu">
            <div class="custom-select-option cso3" onclick="selectCustomOption(this, 'all')">
              <span>${_L('ui_all_accounts')}</span>
              <i class="fa-solid fa-check option-check"></i>
            </div>
            <div class="custom-select-option cso3" onclick="selectCustomOption(this, 'checking')">
              <span>${_L('ui_checking_account')}</span>
              <i class="fa-solid fa-check option-check"></i>
            </div>
            <div class="custom-select-option cso3" onclick="selectCustomOption(this, 'savings')">
              <span>${_L('ui_savings_account')}</span>
              <i class="fa-solid fa-check option-check"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="page-info">
      <div class="column column-transactions">
        <div class="item item-transactions-stats">
          <div class="item-header">
            <div class="item-title">${_L('ui_statistics')}</div>
          </div>
          <div class="item-body ib-stats">
            <div class="stats-grid">
              <div class="stat-card">
                <div class="stat-value" id="totalTransactions">124</div>
                <div class="stat-label">${_L('ui_total_transactions')}</div>
              </div>
              <div class="stat-card">
                <div class="stat-value positive" id="totalReceived"></div>
                <div class="stat-label">${_L('ui_total_received')}</div>
              </div>
              <div class="stat-card">
                <div class="stat-value negative" id="totalSent"></div>
                <div class="stat-label">${_L('ui_total_sent')}</div>
              </div>
              <div class="stat-card">
                <div class="stat-value earnings" id="netEarnings"></div>
                <div class="stat-label">${_L('ui_net_earnings')}</div>
              </div>
            </div>
          </div>
        </div>
        <div class="item item-transactions-table">
          <div class="item-header">
            <div class="item-title">${_L('ui_history')}</div>
          </div>
          <div class="item-body ib-transactions">
            <div class="transactions-header">
              <div class="th-type">${_L('ui_type')}</div>
              <div class="th-description">${_L('ui_description')}</div>
              <div class="th-date">${_L('ui_date')}</div>
              <div class="th-amount">${_L('ui_amount')}</div>
              <div class="th-actions">${_L('ui_actions')}</div>
            </div>
            <div class="transactions-list"></div>
            <div class="transactions-pagination">
              <div class="pagination-controls">
                <button class="pagination-btn" disabled><i class="fa-solid fa-chevron-left"></i></button>
                <button class="pagination-btn active">1</button>
                <button class="pagination-btn">2</button>
                <button class="pagination-btn">3</button>
                <button class="pagination-btn">...</button>
                <button class="pagination-btn">16</button>
                <button class="pagination-btn"><i class="fa-solid fa-chevron-right"></i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  `,

  savings: () => `
    <div class="page">
        <span class="page-title">${_L('ui_savings')}</span>
    </div>
    <div class="page-info">
        <div class="column column-savings-left">
            <div class="item item-savings-summary">
                <div class="item-header">
                    <div class="item-title">${_L('ui_summary')}</div>
                </div>
                <div class="item-body ib-s">
                    <div class="balance-actions">
                        <div class="balance-div">
                            <div class="balance-value"></div>
                            <div class="balance-label">${_L('ui_balance')}</div>
                        </div>
                        <div class="balance-buttons">
                            <div id="depositButton" class="btn-blue btn-bal" data-page="savings">${_L('ui_deposit')}</div>
                            <div id="withdrawButton" class="btn-blue btn-bal" data-page="savings">${_L('ui_withdraw')}</div>
                            <div id="transferButton" class="btn-blue btn-bal" data-page="savings">${_L('ui_transfer')}</div>
                        </div>
                    </div>
                    <div class="chart">
                        <svg id="savingsChart" viewBox="0 0 400 150" preserveAspectRatio="xMidYMid meet">
                            <defs>
                                <linearGradient id="savingsAreaGradient" x1="0%" y1="0%" x2="0%" y2="100%">
                                    <stop offset="0%" style="stop-color:#1f5eff;stop-opacity:0.3"/>
                                    <stop offset="100%" style="stop-color:#1f5eff;stop-opacity:0.05"/>
                                </linearGradient>
                            </defs>

                            <path id="savingsAreaPath" fill="url(#savingsAreaGradient)" />
                            <path id="savingsLinePath" fill="none" stroke="#1f5eff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" />
                            <g id="savingsPointsGroup"></g>
                        </svg>
                <div class="chart-labels" id="savingsChartLabels"></div>
                    </div>
                </div>
            </div>
            <div class="item item-last-transactions">
                <div class="item-header">
                    <div class="item-title">${_L('ui_recent_transactions')}</div>
                    <div class="text-btn-header view-transactions">${_L('ui_view_all')}</div>
                </div>
                <div class="item-body ib-lt">
                    <div class="lt-noinfo">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                        <div class="cni-ft">${_L('ui_no_recent_activity')}</div>
                        <div class="cni-lt">${_L('ui_savings_transactions_appear_here')}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="column column-savings-right">
            <div class="item item-interest-tracker">
                <div class="item-header">
                    <div class="item-title">${_L('ui_interest_tracker')}</div>
                </div>
                <div class="item-body ib-interest">
                    <div class="interest-summary">
                        <div class="interest-total">
                            <div class="interest-value">+ 3.550€</div>
                            <div class="interest-label">${_L('ui_total_interest_earned')}</div>
                        </div>
                    </div>
                    <div class="interest-breakdown">
                        <div class="interest-period">
                            <div class="period-header">
                                <span class="period-name">${_L('ui_this_week')}</span>
                                <span class="period-amount"></span>
                            </div>
                            <div class="period-details">
                                <div class="detail-item">
                                    <span>${_L('ui_interest_rate')}</span>
                                    <span>2.5%</span>
                                </div>
                                <div class="detail-item">
                                    <span>${_L('ui_next_payout')}</span>
                                    <span class="period-end">Sun 21:00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item item-saving-goals">
                <div class="item-header">
                    <div class="item-title">${_L('ui_saving_goals')}</div>
                    <div id="createNewGoalButton" class="text-btn-header">${_L('ui_new')}</div>
                </div>
                <div class="item-body ib-goals pr-0375">
                    <div class="saving-goals-list">
                    </div>
                </div>
            </div>
        </div>
    </div>
  `,
  bills: () => `
    <div class="page">
                    <span class="page-title">${_L('ui_bills')}</span>
                    <div class="bills-buttons">
                        <input type="text" id="billsSearch" class="search-input" placeholder="${_L('ui_search')}">
                        <div class="btn-blue btn-pr pay-all-bills" onclick="payAllBills()"><i class="fa-solid fa-credit-card"></i>&nbsp;${_L('ui_pay_all')}</div>
                    </div>
                </div>
                <div class="page-info">
                    <div class="column column-bills">
                        <div class="item item-bills-table">
                            <div class="item-header">
                                <div class="item-title">${_L('ui_history')}</div>
                            </div>
                            <div class="item-body ib-bills">
                                <div class="bills-header">
                                    <div class="th-type-b">#</div>
                                    <div class="th-description-b">${_L('ui_status')}</div>
                                    <div class="th-date-b">${_L('ui_author')}</div>
                                    <div class="th-amount-b">${_L('ui_amount')}</div>
                                    <div class="th-actions-b">${_L('ui_actions')}</div>
                                </div>
                                <div class="bills-list">
                                    <div class="bill-row">
                                    </div>
                                </div>
                                <div class="bills-pagination">
                                    <div class="pagination-controls">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
  `,
  pin: () => `
    <div class="pin-menu">
      <div class="pin-header">
          <div>${_L('ui_pin')}</div>
          <div class="pin-close-button"><i class="fas fa-times"></i></div>
      </div>
      <div class="pin-body">
          <div class="pin-dots">
              <div class="pin-dot pin-dot-1"></div>
              <div class="pin-dot pin-dot-2"></div>
              <div class="pin-dot pin-dot-3"></div>
              <div class="pin-dot pin-dot-4"></div>
          </div>
          <div class="pin-inputs">
              <div class="pin-input" onclick="insertPin('1')">1</div>
              <div class="pin-input" onclick="insertPin('2')">2</div>
              <div class="pin-input" onclick="insertPin('3')">3</div>
              <div class="pin-input" onclick="insertPin('4')">4</div>
              <div class="pin-input" onclick="insertPin('5')">5</div>
              <div class="pin-input" onclick="insertPin('6')">6</div>
              <div class="pin-input" onclick="insertPin('7')">7</div>
              <div class="pin-input" onclick="insertPin('8')">8</div>
              <div class="pin-input" onclick="insertPin('9')">9</div>
              <div class="pin-input" onclick="insertPin('C')">C</div>
              <div class="pin-input" onclick="insertPin('0')">0</div>
              <div class="pin-input" onclick="insertPin('OK')">OK</div>
          </div>
      </div>
  </div>
  `,
  accountSelection: () => `
    <div class="select-account-menu">
      <div class="select-account-header">
          <div>${_L('ui_select_account')}</div>
          <div class="pin-close-button"><i class="fas fa-times"></i></div>
      </div>
      <div class="select-account-body"></div>
  </div>
  `,
};


function toggleAutoRenew() {
  const toggleSwitch = document.querySelector('.toggle-switch');
  toggleSwitch.classList.toggle('off');
  $('.auto-renew-toggle').val(toggleSwitch.classList.contains('off') ? false : true);


  const isOn = !toggleSwitch.classList.contains('off');
}

$(document).on('click', '.toggle-switch', function () {
  toggleAutoRenew();
});


function updateStaticElements() {

  const overviewNav = document.querySelector('.nav-item.overview .nav-item-text');
  if (overviewNav) overviewNav.textContent = _L('ui_overview');

  const loansNav = document.querySelector('.nav-item.loans .nav-item-text');
  if (loansNav) loansNav.textContent = _L('ui_loans');

  const savingsNav = document.querySelector('.nav-item.savings .nav-item-text');
  if (savingsNav) savingsNav.textContent = _L('ui_savings');

  const billsNav = document.querySelector('.nav-item.bills .nav-item-text');
  if (billsNav) billsNav.textContent = _L('ui_bills');

  const transactionsNav = document.querySelector('.nav-item.transactions .nav-item-text');
  if (transactionsNav) transactionsNav.textContent = _L('ui_transactions');


  const currentAccountName = document.querySelector('.account-current .account-name');
  if (currentAccountName) currentAccountName.textContent = _L('ui_personal_account');

  const currentAccountType = document.querySelector('.account-current .account-type');
  if (currentAccountType) currentAccountType.textContent = _L('ui_your_account');


  const personalAccount = document.querySelector('.account-option[onclick="selectAccount(\'personal\')"] .account-name');
  if (personalAccount) personalAccount.textContent = _L('ui_personal_account');

  const personalAccountType = document.querySelector('.account-option[onclick="selectAccount(\'personal\')"] .account-type');
  if (personalAccountType) personalAccountType.textContent = _L('ui_your_account');


  const businessAccount = document.querySelector('.account-option[onclick="selectAccount(\'business\')"] .account-name');
  if (businessAccount) businessAccount.textContent = _L('ui_business_account');

  const businessAccountType = document.querySelector('.account-option[onclick="selectAccount(\'business\')"] .account-type');
  if (businessAccountType) businessAccountType.textContent = _L('ui_company');


  const savingsAccount = document.querySelector('.account-option[onclick="selectAccount(\'savings\')"] .account-name');
  if (savingsAccount) savingsAccount.textContent = _L('ui_savings_account');

  const savingsAccountType = document.querySelector('.account-option[onclick="selectAccount(\'savings\')"] .account-type');
  if (savingsAccountType) savingsAccountType.textContent = _L('ui_high_yield');


  const createAccount = document.querySelector('.account-option.create-new-option .account-name');
  if (createAccount) createAccount.textContent = _L('ui_create_new_account');

  const createAccountType = document.querySelector('.account-option.create-new-option .account-type');
  if (createAccountType) createAccountType.textContent = _L('ui_add_account');


  const depositTitle = document.getElementById('deposit_money_title');
  if (depositTitle) depositTitle.textContent = _L('ui_deposit_money');

  const withdrawTitle = document.getElementById('withdraw_money_title');
  if (withdrawTitle) withdrawTitle.textContent = _L('ui_withdraw_money');

  const transferTitle = document.getElementById('transfer_money_title');
  if (transferTitle) transferTitle.textContent = _L('ui_transfer_money');


  const depositBtn = document.getElementById('deposit_btn');
  if (depositBtn) depositBtn.textContent = _L('ui_deposit');

  const withdrawBtn = document.getElementById('withdraw_btn');
  if (withdrawBtn) withdrawBtn.textContent = _L('ui_withdraw');

  const transferBtn = document.getElementById('transfer_btn');
  if (transferBtn) transferBtn.textContent = _L('ui_transfer');


  const depositInput = document.getElementById('deposit_money');
  if (depositInput) depositInput.placeholder = _L('ui_amount');

  const withdrawInput = document.getElementById('withdraw_money');
  if (withdrawInput) withdrawInput.placeholder = _L('ui_amount');

  const transferIbanInput = document.getElementById('transfer_iban');
  if (transferIbanInput) transferIbanInput.placeholder = _L('ui_iban');

  const transferAmountInput = document.getElementById('transfer_amount');
  if (transferAmountInput) transferAmountInput.placeholder = _L('ui_amount');


  const externalAccOption = document.querySelector('#transfer_option_external div:last-child');
  if (externalAccOption) externalAccOption.textContent = _L('ui_external_account');

  const savingsAccOption = document.querySelector('#transfer_option_savings div:last-child');
  if (savingsAccOption) savingsAccOption.textContent = _L('ui_savings_account');

  const businessAccOption = document.querySelector('#transfer_option_business div:last-child');
  if (businessAccOption) businessAccOption.textContent = _L('ui_business_account');

  const multipleContactsOption = document.querySelector('#transfer_custom_accounts_menu .custom-select-option:nth-child(4) div:last-child');
  if (multipleContactsOption) multipleContactsOption.textContent = _L('ui_multiple_contacts');

  const transferRecipientText = document.getElementById('transfer_recipient_text');
  if (transferRecipientText) transferRecipientText.textContent = _L('ui_select_recipient');


  const transferRecipientLabel = document.querySelector('#transfer_recipient_group .modal-option-title');
  if (transferRecipientLabel) transferRecipientLabel.textContent = _L('ui_recipient');

  const transferIbanLabel = document.querySelector('#transfer_iban_group .modal-option-title');
  if (transferIbanLabel) transferIbanLabel.textContent = _L('ui_iban');

  const transferAmountLabel = document.querySelector('#transfer_amount_group .modal-option-title');
  if (transferAmountLabel) transferAmountLabel.textContent = _L('ui_amount');


  const multipleContactsTitle = document.getElementById('multiple_contacts_title');
  if (multipleContactsTitle) multipleContactsTitle.textContent = _L('ui_multiple_contacts');

  const multipleContactsSearch = document.getElementById('multipleContactsSearch');
  if (multipleContactsSearch) multipleContactsSearch.placeholder = _L('ui_search');

  const addNewContactBtn = document.getElementById('addNewContact');
  if (addNewContactBtn) addNewContactBtn.textContent = _L('ui_add_new');

  const saveContactBtn = document.getElementById('saveContactBtn');
  if (saveContactBtn) saveContactBtn.textContent = _L('ui_save_contact');

  const newContactNameLabel = document.querySelector('#newContactName .modal-option-title');
  if (newContactNameLabel) newContactNameLabel.textContent = _L('ui_name');

  const newContactIbanLabel = document.querySelector('#newContactIban .modal-option-title');
  if (newContactIbanLabel) newContactIbanLabel.textContent = _L('ui_iban');


  const newCardTitle = document.getElementById('new_card_title');
  if (newCardTitle) newCardTitle.textContent = _L('ui_create_new_card');

  const cardTypeLabel = document.querySelector('#createNewCardModal .modal-option-group:first-child .modal-option-title');
  if (cardTypeLabel) cardTypeLabel.textContent = _L('ui_card_type');

  const selectCardText = document.querySelector('#createNewCardModal .custom-select-text');
  if (selectCardText) selectCardText.textContent = _L('ui_select_card');

  const pinNumberLabel = document.querySelector('#createNewCardModal .modal-option-group:nth-child(2) .modal-option-title');
  if (pinNumberLabel) pinNumberLabel.textContent = _L('ui_pin_number');

  const createCardBtn = document.getElementById('createnewcard_btn');
  if (createCardBtn) createCardBtn.textContent = _L('ui_create');


  const manageCardTitle = document.getElementById('manage_card_title');
  if (manageCardTitle) manageCardTitle.textContent = _L('ui_manage_card');

  const statusLabel = document.querySelector('#manageCardModal .modal-option-group:first-child .modal-option-title');
  if (statusLabel) statusLabel.textContent = _L('ui_status');

  const expiryLabel = document.querySelector('#manageCardModal .modal-option-group:nth-child(2) .modal-option-title');
  if (expiryLabel) expiryLabel.textContent = _L('ui_expiry');

  const currentExpiryLabel = document.querySelector('#manageCardModal .renewal-label');
  if (currentExpiryLabel) currentExpiryLabel.textContent = _L('ui_current_expiry');

  const autoRenewLabel = document.querySelector('#manageCardModal .toggle-label');
  if (autoRenewLabel) autoRenewLabel.textContent = _L('ui_auto_renew');

  const blockingWarningTitle = document.querySelector('#manageCardModal .manage-card-alert-blocking .alert-title');
  if (blockingWarningTitle) blockingWarningTitle.textContent = _L('ui_warning');

  const activatingInfoTitle = document.querySelector('#manageCardModal .manage-card-alert-activating .alert-title');
  if (activatingInfoTitle) activatingInfoTitle.textContent = _L('ui_information');

  const deleteCardTitle = document.querySelector('#manageCardModal .alert-danger .alert-title');
  if (deleteCardTitle) deleteCardTitle.textContent = _L('ui_delete_card');

  const deleteCardMessage = document.querySelector('#manageCardModal .alert-danger .alert-message');
  if (deleteCardMessage) deleteCardMessage.textContent = _L('ui_delete_card_warning');

  const deleteCardBtn = document.querySelector('#manageCardModal .delete-card-btn');
  if (deleteCardBtn) deleteCardBtn.textContent = _L('ui_delete_card');

  const manageCardConfirmBtn = document.getElementById('manage_card_btn');
  if (manageCardConfirmBtn) manageCardConfirmBtn.textContent = _L('ui_confirm');


  const accountUsersTitle = document.getElementById('account_users_title');
  if (accountUsersTitle) accountUsersTitle.textContent = _L('ui_manage_account_users');

  const usersTableHeaders = document.querySelectorAll('#accountUsersModal .users-table-header .table-col');
  if (usersTableHeaders.length >= 6) {
    usersTableHeaders[0].textContent = _L('ui_name');
    usersTableHeaders[1].textContent = _L('ui_deposit');
    usersTableHeaders[2].textContent = _L('ui_withdraw');
    usersTableHeaders[3].textContent = _L('ui_transfer');
    usersTableHeaders[4].textContent = _L('ui_loans');
    usersTableHeaders[5].textContent = _L('ui_actions');
  }

  const noUsersMessage = document.querySelector('#accountUsersModal .no-users-message');
  if (noUsersMessage) noUsersMessage.textContent = _L('ui_no_users_yet');

  const saveAccessBtn = document.getElementById('save_access_btn');
  if (saveAccessBtn) saveAccessBtn.textContent = _L('ui_save_changes');


  const manageGoalTitle = document.querySelector('#manageGoalModal .modal-t');
  if (manageGoalTitle) manageGoalTitle.textContent = _L('ui_manage_saving_goal');

  const goalLabel = document.querySelector('#manageGoalModal .gsi-group:first-child .gsi-label');
  if (goalLabel) goalLabel.textContent = _L('ui_goal');

  const savedLabel = document.querySelector('#manageGoalModal .gsi-group:last-child .gsi-label');
  if (savedLabel) savedLabel.textContent = _L('ui_saved');

  const addToGoalLabel = document.querySelector('#manageGoalModal .modal-option-group:first-child .modal-option-title');
  if (addToGoalLabel) addToGoalLabel.textContent = _L('ui_add_to_goal');

  const addToGoalBtn = document.getElementById('addToGoalBtn');
  if (addToGoalBtn) addToGoalBtn.textContent = _L('ui_add');

  const withdrawFundsBtn = document.getElementById('withdrawGoalFundsBtn');
  if (withdrawFundsBtn) withdrawFundsBtn.textContent = _L('ui_withdraw_funds');


  const createGoalTitle = document.querySelector('#createNewGoalModal .modal-t');
  if (createGoalTitle) createGoalTitle.textContent = _L('ui_create_new_saving_goal');

  const goalNameLabel = document.querySelector('#createNewGoalModal .modal-option-group:first-child .modal-option-title');
  if (goalNameLabel) goalNameLabel.textContent = _L('ui_goal_name');

  const targetAmountLabel = document.querySelector('#createNewGoalModal .modal-option-group:nth-child(2) .modal-option-title');
  if (targetAmountLabel) targetAmountLabel.textContent = _L('ui_target_amount');

  const initialDepositLabel = document.querySelector('#createNewGoalModal .modal-option-group:nth-child(3) .modal-option-title');
  if (initialDepositLabel) initialDepositLabel.textContent = _L('ui_initial_deposit');

  const createGoalBtn = document.getElementById('createNewGoalBtn');
  if (createGoalBtn) createGoalBtn.textContent = _L('ui_create');


  const manageLoanTitle = document.querySelector('#manageLoanModal .modal-t');
  if (manageLoanTitle) manageLoanTitle.textContent = _L('ui_manage_personal_loan');

  const loanWarningTitle = document.querySelector('#manageLoanModal .alert-warning .alert-title');
  if (loanWarningTitle) loanWarningTitle.textContent = _L('ui_warning');

  const loanWarningMessage = document.querySelector('#manageLoanModal .alert-warning .alert-message');
  if (loanWarningMessage) loanWarningMessage.innerHTML = _L('ui_loan_overdue_warning');

  const loanSummaryLabels = document.querySelectorAll('#manageLoanModal .loan-summary-item .lsi-label');
  if (loanSummaryLabels.length >= 4) {
    loanSummaryLabels[0].textContent = _L('ui_total');
    loanSummaryLabels[1].textContent = _L('ui_remaining');
    loanSummaryLabels[2].textContent = _L('ui_daily_payment');
    loanSummaryLabels[3].textContent = _L('ui_next_payment');
  }

  const partialPaymentLabel = document.querySelector('#manageLoanModal .modal-option-group:first-child .modal-option-title');
  if (partialPaymentLabel) partialPaymentLabel.textContent = _L('ui_partial_payment');

  const partialPaymentBtn = document.querySelector('#manageLoanModal .partial-payment-btn');
  if (partialPaymentBtn) partialPaymentBtn.textContent = _L('ui_pay');

  const payOffLoanBtn = document.getElementById('payOffLoanBtn');
  if (payOffLoanBtn) payOffLoanBtn.textContent = _L('ui_pay_off_loan');


  const billSentLabel = document.getElementById('bill-modal-sent-label');
  if (billSentLabel) billSentLabel.textContent = _L('ui_sent') + ': ';

  const billDueLabel = document.getElementById('bill-modal-due-label');
  if (billDueLabel) billDueLabel.textContent = _L('ui_due') + ': ';

  const billToLabel = document.getElementById('bill-modal-to-label');
  if (billToLabel) billToLabel.textContent = _L('ui_to') + ': ';

  const billFromLabel = document.getElementById('bill-modal-from-label');
  if (billFromLabel) billFromLabel.textContent = _L('ui_from') + ': ';

  const billNotesLabel = document.getElementById('bill-modal-notes-label');
  if (billNotesLabel) billNotesLabel.textContent = _L('ui_notes') + ': ';

  const billSubtotalLabel = document.getElementById('bill-modal-subtotal-label');
  if (billSubtotalLabel) billSubtotalLabel.textContent = _L('ui_subtotal');

  const billTotalLabel = document.getElementById('bill-modal-total-label');
  if (billTotalLabel) billTotalLabel.textContent = _L('ui_total');

  const payBillBtn = document.getElementById('paybill_btn');
  if (payBillBtn) payBillBtn.textContent = _L('ui_pay');

  const printReceiptBtn = document.getElementById('print_receipt_btn');
  if (printReceiptBtn) printReceiptBtn.textContent = _L('ui_print_receipt');


  const transactionTitle = document.querySelector('#viewTransactionModal .modal-t');
  if (transactionTitle) transactionTitle.textContent = _L('ui_transaction_details');

  const transactionLabels = document.querySelectorAll('#viewTransactionModal .transaction-modal-info > div:first-child');
  const txLabelKeys = ['ui_type', 'ui_status', 'ui_date', 'ui_from', 'ui_sender_iban', 'ui_to', 'ui_receiver_iban'];
  transactionLabels.forEach((label, index) => {
    if (txLabelKeys[index]) label.textContent = _L(txLabelKeys[index]) + ':';
  });

  const transactionTotalLabel = document.querySelector('#viewTransactionModal .transaction-modal-total div:first-child');
  if (transactionTotalLabel) transactionTotalLabel.textContent = _L('ui_total');

  const printTransactionBtn = document.getElementById('printreceipt_btn');
  if (printTransactionBtn) printTransactionBtn.textContent = _L('ui_print_receipt');


  const creditScoreTitle = document.querySelector('#creditScoreModal .modal-t');
  if (creditScoreTitle) creditScoreTitle.textContent = _L('ui_credit_score_ranks');

  const creditScoreTableHeaders = document.querySelectorAll('#creditScoreModal .cst-col');
  if (creditScoreTableHeaders.length >= 3) {
    creditScoreTableHeaders[0].textContent = _L('ui_score');
    creditScoreTableHeaders[1].textContent = _L('ui_rank');
    creditScoreTableHeaders[2].textContent = _L('ui_rate');
  }

  const creditScoreInfoTitle = document.querySelector('#creditScoreModal .alert-info .alert-title');
  if (creditScoreInfoTitle) creditScoreInfoTitle.textContent = _L('ui_information');

  const creditScoreInfoMessage = document.querySelector('#creditScoreModal .alert-info .alert-message');
  if (creditScoreInfoMessage) creditScoreInfoMessage.innerHTML = `${_L('ui_credit_score_info_text')} <span class="bold">${_L('ui_higher_scores_lower_rates')}</span>, ${_L('ui_lower_scores_increase')}`;


  const higherRatesBadge = document.querySelector('.loan-badge');
  if (higherRatesBadge) higherRatesBadge.textContent = _L('ui_higher_rates');


  const transactionStatus = document.getElementById('transaction-modal-status');
  if (transactionStatus) transactionStatus.textContent = _L('ui_completed');
}

async function loadStaticConfiguration() {
  try {
    const response = await fetch(`https://${GetParentResourceName()}/getConfiguration`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({})
    });

    if (response.ok) {
      const config = await response.json();


      if (config.locales) {
        localeStrings = config.locales;

        updateStaticElements();
      }


      if (config.currency) {
        currentCurrency = config.currency;
      }

      if (config.loansConfig) {
        loansConfig = config.loansConfig
      }

      if (config.useOkOkBankingSounds !== undefined) {
        useOkOkBankingSounds = config.useOkOkBankingSounds
      }

      if (config.creditScoreConfig) {
        creditScoreConfig = config.creditScoreConfig
      }

      if (config.cardsConfig) {
        cardsConfig = config.cardsConfig
      }

      if (config.maxActiveGoals !== undefined) {
        maxActiveGoals = config.maxActiveGoals
      }

      if (config.businessMaxActiveGoals !== undefined) {
        businessMaxActiveGoals = config.businessMaxActiveGoals
      }

      if (config.customMaxActiveGoals !== undefined) {
        customMaxActiveGoals = config.customMaxActiveGoals
      }

      if (config.printReceiptPrice !== undefined) {
        printReceiptPrice = config.printReceiptPrice
      }

      if (config.maxTransferContactsFavorites !== undefined) {
        maxTransferContactsFavorites = config.maxTransferContactsFavorites
      }

      if (config.ibanChangeCost !== undefined) {
        ibanChangeCost = config.ibanChangeCost
      }

      if (config.pinChangeCost !== undefined) {
        pinChangeCost = config.pinChangeCost
      }

      if (config.newAccountCost !== undefined) {
        newAccountCost = config.newAccountCost
      }

      if (config.creditCardRenewalFee !== undefined) {
        if (!cardsConfig) cardsConfig = {};
        cardsConfig.creditCardRenewalFee = config.creditCardRenewalFee;
      }

      if (config.customAccountsConfig) {
        customAccountsConfig = config.customAccountsConfig
      }

      if (config.inventoryWithMetadata !== undefined) {
        inventoryWithMetadata = config.inventoryWithMetadata;
      }

      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}

function loadCreditScoreConfig(playerScore) {
  if (!creditScoreConfig || !creditScoreConfig.bands) {
    return;
  }


  const sortedBands = [...creditScoreConfig.bands].sort((a, b) => b.min - a.min);


  var currentBandIndex = -1;
  for (var i = 0; i < sortedBands.length; i++) {
    if (playerScore >= sortedBands[i].min) {
      currentBandIndex = i;
      break;
    }
  }


  var ranksHTML = '';
  sortedBands.forEach((band, index) => {
    const isCurrentBand = index === currentBandIndex;
    const currentClass = isCurrentBand ? 'credit-score-current' : '';


    const minScore = band.min;
    const maxScore = index === 0 ? creditScoreConfig.max : sortedBands[index - 1].min - 1;
    const rangeText = `${minScore}-${maxScore}`;


    const modifier = band.modifier;
    const modifierText = modifier > 0 ? `+ ${modifier}%` : `- ${Math.abs(modifier)}%`;
    const modifierClass = modifier < 0 ? 'csr-modifier-negative' : modifier > 0 ? 'csr-modifier-positive' : 'csr-modifier-neutral';

    ranksHTML += `
      <div class="credit-score-row ${currentClass} ${modifierClass}">
          <div class="cst-cell cst-min">${rangeText}</div>
          <div class="cst-cell cst-label">${band.label}</div>
          <div class="cst-cell cst-modifier">${modifierText}</div>
      </div>
      `;
  });


  const tableBody = document.querySelector('.credit-score-table-body');
  if (tableBody) {
    tableBody.innerHTML = ranksHTML;
  }
}


function loadConfigurationFallback(eventData) {
  var updated = false;


  if (!localeStrings && eventData.locales) {
    localeStrings = eventData.locales;
    updateStaticElements();
    updated = true;
  }


  if (localeStrings && localeStrings['ui_language']) {
    window.okokLangCode = localeStrings['ui_language'];
  } else if (eventData.locale) {

    window.okokLangCode = eventData.locale;
  } else {

    window.okokLangCode = navigator.language || 'en-US';
  }

  if (!currentCurrency && eventData.currency) {
    currentCurrency = eventData.currency;
    updated = true;
  }

  if (eventData.ibanChangeCost !== undefined && ibanChangeCost === 5000) {
    ibanChangeCost = eventData.ibanChangeCost;
    updated = true;
  }

  if (eventData.pinChangeCost !== undefined && pinChangeCost === 1000) {
    pinChangeCost = eventData.pinChangeCost;
    updated = true;
  }

  if (eventData.newAccountCost !== undefined && newAccountCost === 10000) {
    newAccountCost = eventData.newAccountCost;
    updated = true;
  }

  if (eventData.creditCardRenewalFee !== undefined) {
    if (!cardsConfig) cardsConfig = {};
    cardsConfig.creditCardRenewalFee = eventData.creditCardRenewalFee;
    updated = true;
  }

  return updated;
}

document.addEventListener('DOMContentLoaded', async function () {

  const ctn = document.querySelector('.container');
  if (ctn) {
    ctn.style.display = 'none';
  }


  await loadStaticConfiguration();


  initializeDemoChart();


  const createBtn = document.getElementById('createnewcard_btn');
  createBtn.disabled = true;
  createBtn.style.opacity = '0.5';
  createBtn.style.cursor = 'default';
});

function initializeAccountDropdown() {

  const dropdownToggle = document.querySelector('.account-current');

  if (dropdownToggle && !dropdownToggle.hasAttribute('data-enhanced')) {


    dropdownToggle.removeAttribute('onclick');


    dropdownToggle.addEventListener('click', function (e) {

      const settingsButton = document.getElementById('accountSettingsButton');
      if (settingsButton && (e.target === settingsButton || settingsButton.contains(e.target))) {
        return;
      }

      e.preventDefault();
      e.stopPropagation();
      toggleAccountDropdown();
    });

    dropdownToggle.setAttribute('data-enhanced', 'true');
  }
}

function initializeDemoChart() {

  const chart = document.querySelector('.chart');
  const balanceChart = document.getElementById('balanceChart');

  if (chart && balanceChart && (!playerTransactions || playerTransactions.length === 0)) {

    const demoData = [32500, 31800, 33200, 34100, 34100, 67000, 35100];
    const demoLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];


    renderBalanceChart(demoLabels, demoData, false);
  }
}


function calcDailyPayment(amount, ratePct, days) {
  const term = Math.max(1, Math.floor(days || 0));
  const contractTotal = Math.round(amount * (1 + ratePct / 100));
  return Math.max(1, Math.round(contractTotal / term));
}


function getCachedActiveLoans() {
  const cacheKey = openedAccount || 'personal';
  return cachedActiveLoans[cacheKey] || null;
}


function setCachedActiveLoans(loans) {
  const cacheKey = openedAccount || 'personal';
  cachedActiveLoans[cacheKey] = loans;
}


async function preloadActiveLoans() {
  const cached = getCachedActiveLoans();
  if (cached !== null) return cached;

  try {
    const res = await fetch(`https://${GetParentResourceName()}/getActiveLoans`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ accountType: openedAccount })
    });
    const data = await res.json();
    const loans = Array.isArray(data.loans) ? data.loans : [];
    setCachedActiveLoans(loans);
    return loans;
  } catch {
    return [];
  }
}

async function fetchAndRenderActiveLoans() {
  try {
    const res = await fetch(`https://${GetParentResourceName()}/getActiveLoans`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ accountType: openedAccount })
    });
    const data = await res.json();
    activeLoans = Array.isArray(data.loans) ? data.loans : [];
    setCachedActiveLoans(activeLoans);

    updateNavbarLoanWarning(activeLoans);
    renderActiveLoans(activeLoans);
  } catch {
    updateNavbarLoanWarning([]);
    renderActiveLoans([]);
  }
}


function escapeHTML(s) {
  return String(s).replace(/[&<>"']/g, m => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[m]));
}

function formatDue(nextDueAtSec, status) {
  const now = Math.floor(Date.now() / 1000);
  const delta = (nextDueAtSec | 0) - now;
  const statusNum = Number(status) || 0;
  const late = statusNum === 1 || statusNum === 3;
  const s = Math.abs(delta);

  if (s >= 86400) {
    const days = Math.floor(s / 86400);
    return { text: late ? _LN('ui_days_late', { days }) : _LN('ui_in_days', { days }), warn: late };
  }
  if (s >= 3600) {
    const hours = Math.floor(s / 3600);
    return { text: late ? _LN('ui_hours_late', { hours }) : _LN('ui_in_hours', { hours }), warn: late };
  }
  const minutes = Math.floor(s / 60);
  return { text: late ? _LN('ui_minutes_late', { minutes }) : _LN('ui_in_minutes', { minutes }), warn: late };
}

function clampPct(x) { x = Number(x) || 0; return Math.max(0, Math.min(100, x)); }

function limitCharacters(name, amountOfCharacters, shortFirstName) {
  if (!name || typeof name !== 'string') return '';
  if (typeof amountOfCharacters !== 'number' || amountOfCharacters <= 0) return name;

  let result = '';

  if (shortFirstName) {

    const words = name.trim().split(/\s+/);

    if (words.length === 0) return '';


    const abbreviatedFirstName = words[0].charAt(0).toUpperCase() + '.';


    const restOfName = words.slice(1).join(' ');


    result = restOfName ? `${abbreviatedFirstName} ${restOfName}` : abbreviatedFirstName;
  } else {

    result = name;
  }


  if (result.length > amountOfCharacters) {
    result = result.substring(0, amountOfCharacters - 3) + '...';
  }

  return result;
}


function updateNavbarLoanWarning(loans) {
  const warningIcon = document.querySelector('.nav-item.loans .nav-item-warning');
  if (!warningIcon) return;

  const loansArray = Array.isArray(loans) ? loans : [];

  const hasLateLoan = loansArray.some(loan => {
    const status = Number(loan.status) || 0;
    return status === 1 || status === 3;
  });


  if (hasLateLoan) {
    warningIcon.style.display = 'inline-block';
  } else {
    warningIcon.style.display = 'none';
  }
}

function renderActiveLoans(list) {
  const wrap = document.querySelector('.active-loans-list');
  if (!wrap) return;

  const loans = Array.isArray(list) ? list : [];


  updateNavbarLoanWarning(loans);

  if (!loans.length) {
    wrap.innerHTML = `
      <div class="al-noinfo">
        <i class="fa-solid fa-hand-holding-dollar"></i>
        <div class="cni-ft">${_L('ui_no_active_loans')}</div>
        <div class="cni-lt">${_L('ui_loan_history_help')}</div>
      </div>`;

    updateActiveLoansScroll();
    wrap.style.paddingRight = '0.625rem';
    return;
  }

  wrap.innerHTML = loans.map((l, index) => {
    const status = l.status || 0;
    const { text, warn } = formatDue(l.due_at || 0, status);
    const pct = clampPct(l.progressPct);

    const loanData = JSON.stringify({
      id: l.id,
      title: l.title || 'Loan',
      amount: l.amount,
      remaining: l.remaining,
      paid: l.paid || 0,
      monthly: l.monthly,
      due_at: l.due_at,
      status: status,
      progressPct: pct
    });

    const loanDataEscaped = loanData.replace(/"/g, '&quot;');
    return `
      <div class="active-loan-item">
        <button class="loan-manage-btn manage-loan-btn" data-loan-data="${loanDataEscaped}">${_L('ui_manage')}</button>
        <div class="active-loan-info">
          <div class="active-loan-header">
            <div class="active-loan-title">${(l.title || 'Loan')}</div>
            <div class="active-loan-amount${warn ? ' ala-warning' : ''}">${formatCurrency(l.amount)}</div>
          </div>
          <div class="active-loan-meta">
            <span class="loan-original-amount">${formatCurrency(l.remaining)} ${_L('ui_remaining')}</span>
            ${warn ? `<i class="fa-solid fa-exclamation-triangle alm-warning"></i>` : ``}
          </div>
        </div>
        <div class="active-loan-progress">
          <div class="al-progress-bar">
            <div class="al-progress-fill${warn ? ' alpf-warning' : ''}" style="width:${pct}%;"></div>
          </div>
          <div class="al-progress-bottom">
            <div class="al-monthly-payment">${formatCurrency(l.monthly)}/${_L('ui_day')}</div>
            <div class="al-progress-text">${text}</div>
          </div>
        </div>
      </div>`;
  }).join('');

  if (loans.length > 3) {
    wrap.style.paddingRight = '0.375rem';
  } else {
    wrap.style.paddingRight = '0.625rem';
  }


  updateActiveLoansScroll();
}


function updateActiveLoansScroll() {
  const list = document.querySelector('.active-loans-list');
  if (!list) return;


  const loanItems = list.querySelectorAll('.active-loan-item');
  const itemCount = loanItems.length;


  if (itemCount <= 3) {
    list.style.overflowY = 'hidden';
    return;
  }


  const hasOverflow = list.scrollHeight > list.clientHeight;
  list.style.overflowY = hasOverflow ? 'auto' : 'hidden';
}


window.addEventListener('resize', updateActiveLoansScroll);

function setCircularProgress(el, percent) {
  const p = Math.max(0, Math.min(100, percent));
  el.style.setProperty('--p', `${p}%`);
}

function renderCreditScoreChart() {
  const chartEl = document.getElementById('creditScoreChart');
  if (!chartEl) return;


  var creditScoreData = {}
  if (currentAccountType === 'business' && societyData && societyData.creditScore) {
    creditScoreData = societyData.creditScore;
  } else if (currentAccountType.startsWith('custom_')) {
    const customAccount = customAccountsData.find(acc => acc.account_identifier === currentAccountType.replace('custom_', ''));
    if (customAccount && customAccount.creditScore) {
      creditScoreData = customAccount.creditScore;
    }
  } else {
    creditScoreData = playerData.creditScore;
  }

  const scoreValueEl = chartEl.querySelector('.credit-score-value');
  if (scoreValueEl) {
    scoreValueEl.textContent = creditScoreData.score;
  }
  loadCreditScoreConfig(creditScoreData.score);

  const scoreLabelEl = chartEl.querySelector('.credit-score-label');
  if (scoreLabelEl) {
    scoreLabelEl.textContent = creditScoreData.info.label;
  }

  const ring = document.querySelector('.circular-progress');
  setCircularProgress(ring, creditScoreData.info.percentage);
}

function renderLoanPlans() {
  const cfg = window.loansConfig?.loanPlans;
  if (!cfg) return;


  let currentBankBalance = 0;
  if (currentAccountType === 'business' && societyData) {
    currentBankBalance = societyData.value || 0;
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const accountIdentifier = currentAccountType.replace('custom_', '');
    const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
    currentBankBalance = customAccount ? (customAccount.balance || 0) : 0;
  } else {
    currentBankBalance = playerData.playerBankMoney || 0;
  }


  const multiplier = window.loansConfig?.loanMaxBankMultiplier || 1;
  const maxLoanLimit = currentBankBalance * multiplier;


  const ORDER = ['starter', 'standard', 'premium', 'executive'];
  const plans = [];

  ORDER.forEach(key => {
    const p = cfg[key];
    if (p && p.enabled !== false && !p.options) plans.push({ key, p });
  });


  const creditScoreData = (currentAccountType === 'business' && societyData && societyData.creditScore)
    ? societyData.creditScore
    : playerData.creditScore;
  var rateModifier = creditScoreData.info.modifier;


  Object.keys(cfg).forEach(key => {
    const p = cfg[key];
    if (!p || p.options || ORDER.includes(key) || p.enabled === false) return;
    plans.push({ key, p });
  });

  const plansWrap = document.querySelector('.loan-plans');
  if (plansWrap) {
    var html = '';
    for (var i = 0; i < plans.length; i += 2) {
      const row = plans.slice(i, i + 2).map(({ key, p }) => {

        const adjRate = (parseFloat(p.interestRate) + (rateModifier || 0)).toFixed(2);
        const daily = calcDailyPayment(p.maxAmount, adjRate, p.months);

        const exceedsLimit = p.maxAmount > maxLoanLimit;
        const btnClass = exceedsLimit ? 'btn-blue fs-1 req-loan-btn loan-btn disabled' : 'btn-blue fs-1 req-loan-btn loan-btn';
        return `
          <div class="loan-plan">
            <div class="loan-plan-title">${p.label}</div>
            <div class="loan-plan-details">
              <div class="loan-plan-amount">${formatCurrency(p.maxAmount)}</div>
              <div class="loan-plan-rate">${adjRate}% ${_L('ui_interest_rate')}</div>
              <div class="loan-plan-term">${formatCurrency(daily.toFixed(2))}/${_L('ui_day')} • ${p.months} ${_L('ui_days')}</div>
            </div>
            <div class="req-loan-div">
              <div class="${btnClass}" data-plan-key="${key}">
                ${_L('ui_request_loan')}
              </div>
            </div>
          </div>`;
      }).join('');
      html += `<div class="loan-plans-row">${row}</div>`;
    }
    plansWrap.innerHTML = html;
  }


  const customWrap = document.querySelector('.custom-loan');
  if (!customWrap) return;

  const custom = cfg.custom && cfg.custom.enabled !== false ? cfg.custom : null;
  if (!custom) {
    customWrap.style.display = 'none';
    return;
  }
  customWrap.style.display = '';

  const opts = (custom.options || []).slice().sort((a, b) => a.months - b.months);
  const first = opts[0] || { months: 12, interestRate: 10 };


  const customMaxAmount = Number(custom.maxAmount) || 500000;

  const optsHTML = opts.map((o, i) => `
    <div class="custom-select-option ${i === 0 ? 'selected' : ''}" data-index="${i}">
      <span>${o.months} ${_L('ui_days')}</span>
      <i class="fa-solid fa-check option-check"></i>
    </div>`).join('');

  customWrap.innerHTML = `
    <div class="loan-plan-title">${custom.label} <span class="loan-badge">${_L('ui_higher_rates')}</span></div>
    <div class="custom-loan-body">
      <div class="custom-loan-form">
        <div class="custom-loan-amount">
          <div class="cl-label">${_L('ui_amount')}</div>
          <input type="text" id="customLoanAmount" class="form-input fi-loan" placeholder="${_L('ui_enter_amount')}" onkeypress="return (event.charCode >= 48 && event.charCode <= 57)" onpaste="event.preventDefault(); this.value = (event.clipboardData.getData('text')).replace(/[^0-9]/g, '')">
        </div>
        <div class="custom-loan-term">
          <div class="cl-label">${_L('ui_term')}</div>
          <div class="custom-select-container">
            <div class="custom-select-current loan-term-select" onclick="toggleLoanTermSelect(this)">
              <span class="custom-select-text">${first.months} ${_L('ui_days')}</span>
              <i class="fa-solid fa-chevron-down custom-select-arrow"></i>
            </div>
            <div class="custom-select-menu">${optsHTML}</div>
          </div>
        </div>
      </div>

      <div class="custom-loan-result">
        <div class="cl-result-option">
          <div class="cl-ro-label">${_L('ui_amount')}</div>
          <div class="cl-ro-value" id="customResultAmount">—</div>
        </div>
        <div class="cl-result-option">
          <div class="cl-ro-label">${_L('ui_term')}</div>
          <div class="cl-ro-value" id="customResultTerm">${first.months} ${_L('ui_days')}</div>
        </div>
        <div class="cl-result-option">
          <div class="cl-ro-label">${_L('ui_interest_rate')}</div>
          <div class="cl-ro-value" id="customAPR">${first.interestRate}%</div>
        </div>
        <div class="cl-result-option">
          <div class="cl-ro-label">${_L('ui_daily_payment')}</div>
          <div class="cl-ro-value cb" id="customMonthly">—</div>
        </div>
        <div class="btn-blue btn-rql loan-btn" data-plan-key="custom">
          ${_L('ui_request_loan')}
        </div>
      </div>
    </div>`;


  const amountEl = document.getElementById('customLoanAmount');
  const aprEl = document.getElementById('customAPR');
  const dailyEl = document.getElementById('customMonthly');
  const resultAmt = document.getElementById('customResultAmount');
  const resultTerm = document.getElementById('customResultTerm');
  const currentEl = customWrap.querySelector('.custom-select-text');
  const menuEl = customWrap.querySelector('.custom-select-menu');
  const trigger = customWrap.querySelector('.custom-select-current');

  var selIdx = 0;
  const customLoanBtn = customWrap.querySelector('.loan-btn');

  function recalc() {
    const term = opts[selIdx].months;

    const rate = (parseFloat(opts[selIdx].interestRate) + (rateModifier || 0)).toFixed(2);
    let raw = toNumber(amountEl.value);


    if (raw > customMaxAmount) {
      raw = customMaxAmount;
      amountEl.value = String(customMaxAmount);
    }

    resultAmt.textContent = raw > 0 ? formatCurrency(raw) : '—';
    resultTerm.textContent = `${term} ${_L('ui_days')}`;
    aprEl.textContent = `${rate}%`;
    dailyEl.textContent = raw > 0 ? formatCurrency(calcDailyPayment(raw, rate, term).toFixed(2)) : '—';
    currentEl.textContent = `${term} ${_L('ui_days')}`;


    if (customLoanBtn) {
      const exceedsLimit = raw > maxLoanLimit;
      if (exceedsLimit) {
        customLoanBtn.classList.add('disabled');
      } else {
        customLoanBtn.classList.remove('disabled');
      }
    }
  }


  menuEl.querySelectorAll('.custom-select-option').forEach(opt => {
    opt.addEventListener('click', () => {
      const container = trigger.closest('.custom-select-container');
      const menu = container.querySelector('.custom-select-menu');
      const arrow = container.querySelector('.custom-select-arrow');

      menuEl.querySelectorAll('.custom-select-option').forEach(o => o.classList.remove('selected'));
      opt.classList.add('selected');
      selIdx = parseInt(opt.getAttribute('data-index'), 10) || 0;


      const term = opts[selIdx].months;
      currentEl.textContent = `${term} ${_L('ui_days')}`;


      if (menu) menu.classList.remove('show');
      if (arrow) arrow.classList.remove('rotated');
      if (trigger) trigger.classList.remove('open');

      recalc();
    });
  });

  amountEl.addEventListener('input', recalc);
  recalc();
}

$(document).on('click', '.loan-btn', async function () {

  if (this.classList.contains('disabled')) {
    return;
  }

  const planKey = this.getAttribute('data-plan-key');


  const planName = planKey === 'custom' ? 'Custom' : (window.loansConfig?.loanPlans?.[planKey]?.label || 'Unknown');
  var amount = 0;
  var days = 0;
  var interestRate = 0;

  if (planKey === 'custom') {
    const amountEl = document.getElementById('customLoanAmount');
    const el = document.querySelector('.custom-select-text');
    amount = toNumber(amountEl.value);
    days = Number((el.textContent.match(/\d+/) || [0])[0]);

    const cfg = window.loansConfig?.loanPlans;
    const max = Number(cfg?.custom?.maxAmount) || 1;

    if (amount > max) {
      amountEl.value = String(max);
      amountEl.dispatchEvent(new Event('input', { bubbles: true }));
      return;
    }


    const custom = cfg?.custom;
    if (custom && custom.options) {
      const selectedOption = custom.options.find(opt => opt.months === days);
      if (selectedOption) {
        interestRate = parseFloat(selectedOption.interestRate) || 0;
      }
    }
  } else {
    const plan = window.loansConfig?.loanPlans?.[planKey];
    if (plan) {
      amount = plan.maxAmount;
      days = plan.months;
      interestRate = parseFloat(plan.interestRate) || 0;
    }
  }


  if (!amount || amount <= 0 || !days || days <= 0) {
    return;
  }


  const creditScoreData = (currentAccountType === 'business' && societyData && societyData.creditScore)
    ? societyData.creditScore
    : playerData.creditScore;
  const rateModifier = creditScoreData?.info?.modifier || 0;
  const adjustedRate = (interestRate + rateModifier).toFixed(2);
  const dailyPayment = calcDailyPayment(amount, adjustedRate, days);
  const totalAmount = amount * (1 + parseFloat(adjustedRate) / 100);


  const confirmText = `
    <div class="loan-summary-div">
      <div class="loan-summary">
        <div class="loan-summary-item">
          <div class="lsi-label">${_L('ui_plan')}</div>
          <div class="lsi-value">${planName}</div>
        </div>
        <div class="loan-summary-item">
          <div class="lsi-label">${_L('ui_amount')}</div>
          <div class="lsi-value">${formatCurrency(amount)}</div>
        </div>
        <div class="loan-summary-item">
          <div class="lsi-label">${_L('ui_interest_rate')}</div>
          <div class="lsi-value">${adjustedRate}%</div>
        </div>
        <div class="loan-summary-item">
          <div class="lsi-label">${_L('ui_daily_payment')}</div>
          <div class="lsi-value">${formatCurrency(dailyPayment.toFixed(2))}</div>
        </div>
        <div class="loan-summary-item">
          <div class="lsi-label">${_L('ui_term')}</div>
          <div class="lsi-value">${days} ${_L('ui_days')}</div>
        </div>
        <div class="loan-summary-item">
          <div class="lsi-label">${_L('ui_total_to_repay')}</div>
          <div class="lsi-value-blue">${formatCurrency(totalAmount.toFixed(2))}</div>
        </div>
      </div>
    </div>
  `;

  openConfirmModal(
    confirmText,
    _L('ui_request_loan'),
    'blue',
    function () {


      const accountType = openedAccount;
      const isBusinessAccount = accountType === 'business';
      const isCustomAccount = accountType && accountType.startsWith('custom_');

      fetch(`https://${GetParentResourceName()}/requestLoan`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({ planKey, amount, months: days, planName, accountType: openedAccount })
      })
        .then(r => r.json())
        .then(data => {
          if (!data.success) return;


          if (data.bankBalance !== undefined && typeof data.bankBalance === 'number') {

            if (isBusinessAccount && societyData) {
              societyData.value = data.bankBalance;
            } else if (isCustomAccount) {
              const accountIdentifier = accountType.replace('custom_', '');
              const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
              if (customAccount) {
                customAccount.balance = data.bankBalance;
              }

              const accountKey = accountType;
              if (accounts[accountKey] && accounts[accountKey].accountData) {
                accounts[accountKey].accountData.balance = data.bankBalance;
              }
            } else {

              playerData.playerBankMoney = data.bankBalance;
            }
            updatePlayerMoney(data.bankBalance);
          }

          if (data.loan) {
            activeLoans.unshift(data.loan);
            renderActiveLoans(activeLoans);
          } else {
            fetchAndRenderActiveLoans();
          }
        });
    }
  );
});

function switchPage(pageName) {
  document.querySelectorAll('.nav-item').forEach(el => el.classList.remove('nav-item-selected'));
  const selected = document.querySelector(`.nav-item.${pageName}`);
  if (selected) selected.classList.add('nav-item-selected');

  const content = document.getElementById('content');
  if (!PageTemplates[pageName] || !content) return;

  try {
    content.innerHTML = PageTemplates[pageName]();
    initializePage(pageName);

    if (!isInitialBankOpen) {
      applyCurrentAccountToUI();
    }
  } catch (error) {
  }
}

function initializePage(pageName) {
  const oldAccountType = currentAccountType;
  const oldOpenedAccount = openedAccount;

  currentPage = pageName;

  if (pageName === 'savings') {

    previousAccountType = currentAccountType;


    if (currentAccountType === 'business') {
      openedAccount = 'business';
    } else if (currentAccountType === 'personal') {
      openedAccount = 'personal';
    } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
      openedAccount = currentAccountType;
    } else {
      openedAccount = 'personal';
    }

    currentAccountType = 'savings';
  } else {


    if (currentAccountType === 'savings') {

      if (openedAccount === 'business' || openedAccount === 'personal') {
        currentAccountType = openedAccount;
      } else {

        currentAccountType = previousAccountType || 'personal';
        openedAccount = currentAccountType;
      }
    } else if (!currentAccountType || currentAccountType === 'card') {

      currentAccountType = previousAccountType || 'personal';
    }

    if (pageName === 'overview') {


      const accountUsersButton = document.querySelector('.account-users-button');
      if (accountUsersButton) {
        let shouldDisable = false;

        if (currentAccountType === 'personal' || currentAccountType === 'savings') {
          shouldDisable = true;
        } else if (currentAccountType === 'business') {

          shouldDisable = !(playerData && playerData.isBoss);
        } else if (currentAccountType && currentAccountType.startsWith('custom_')) {

          const accountIdentifier = currentAccountType.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          shouldDisable = !(customAccount && customAccount.is_owner);
        }

        if (shouldDisable) {
          accountUsersButton.disabled = true;
          accountUsersButton.style.opacity = 0.5;
          accountUsersButton.style.cursor = 'default';
          accountUsersButton.style.pointerEvents = 'none';
        } else {
          accountUsersButton.disabled = false;
          accountUsersButton.removeAttribute('style');
        }
      }
    }
  }

  if (pageName === 'loans') {
    renderCreditScoreChart();
    renderLoanPlans();


    const cachedLoans = getCachedActiveLoans();
    if (cachedLoans !== null) {

      activeLoans = cachedLoans;
      updateNavbarLoanWarning(activeLoans);
      renderActiveLoans(activeLoans);

      fetchAndRenderActiveLoans();
    } else {

      fetchAndRenderActiveLoans();
    }
  } else if (pageName === 'savings') {

    let transactionsToUse = [];
    if (openedAccount === 'business') {
      transactionsToUse = societyTransactions || [];
    } else if (openedAccount && openedAccount.startsWith('custom_')) {
      transactionsToUse = customAccountsData.find(acc => acc.account_identifier === openedAccount.replace('custom_', ''))?.transactions || [];
    } else {
      transactionsToUse = playerTransactions || [];
    }
    populateLastSavingsTransactions(transactionsToUse);


    const accountId = getCurrentAccountId();
    lastRenderedSavingsAccount = accountId;


    requestAnimationFrame(() => {
      populateBalanceChartFromSavingsTransactions(transactionsToUse);
    });


    const cachedGoals = getCachedSavingsGoals();
    if (cachedGoals !== null) {

      renderSavingsGoals(cachedGoals);

      fetchAndRenderSavingsGoals();
    } else {

      const createBtn = document.getElementById('createNewGoalButton');
      if (createBtn) {
        createBtn.disabled = true;
        createBtn.style.opacity = '0.5';
        createBtn.style.cursor = 'default';
        createBtn.style.color = '#fff';
      }
      fetchAndRenderSavingsGoals();
    }
  } else if (pageName === 'bills') {

    updatePayAllButtonVisibility();
  } else if (pageName === 'transactions') {

    selectedAccountFilter = 'all';

    updateAccountFilterDropdown();
  }
}


const TXS_PER_PAGE = 4;
var __txPager = null;

const __preloadPromises = { personal: null, business: null };

var selectedAccountFilter = 'all';

function initTransactionsPager() {

  const list = document.querySelector('.transactions-list');
  const pag = document.querySelector('.transactions-pagination');
  if (!list || !pag) return;


  const txs = Array.isArray(__txPager?.txs) ? __txPager.txs : [];
  const originalTxs = Array.isArray(__txPager?.originalTxs) ? __txPager.originalTxs : txs;
  const total = txs.length;
  const totalPages = Math.max(1, Math.ceil(total / TXS_PER_PAGE));


  __txPager = {
    ...(__txPager || {}),
    txs,
    total,
    totalPages,
    page: 1,
    list,
    pag,
    originalTxs: originalTxs,
  };


  if (!pag.dataset.bound) {
    pag.addEventListener('click', (ev) => {
      const btn = ev.target.closest('.pagination-btn');
      if (!btn || btn.disabled) return;
      const page = parseInt(btn.dataset.page, 10);
      if (!isNaN(page)) showTxPage(page);
    });
    pag.dataset.bound = '1';
  }


  const searchInput = document.getElementById('transactionsSearch');
  if (searchInput && !searchInput.dataset.bound) {
    searchInput.addEventListener('input', (e) => {
      filterTransactions(e.target.value);
    });
    searchInput.dataset.bound = '1';
  }


  if (selectedAccountFilter === 'all') {
    showTxPage(1);
  }
}


function filterTransactionsByAccountType(txs, accountType) {
  if (!txs || !Array.isArray(txs)) return [];

  if (accountType === 'all') {
    return txs;
  } else if (accountType === 'savings') {

    return txs.filter(tx => {
      const txType = String(tx.type || '');
      return txType.includes('_savings');
    });
  } else if (accountType === 'checking') {

    return txs.filter(tx => {
      const txType = String(tx.type || '');
      return !txType.includes('_savings');
    });
  }

  return txs;
}


function filterTransactions(searchQuery) {
  if (!__txPager) return;

  const query = String(searchQuery || '').trim().toLowerCase();
  const originalTxs = __txPager.originalTxs || __txPager.txs || [];


  let filteredTxs = filterTransactionsByAccountType(originalTxs, selectedAccountFilter);

  if (!query) {

    __txPager.txs = filteredTxs;
  } else {

    __txPager.txs = filteredTxs.filter(tx => {

      const senderName = String(tx.sender_name || '').toLowerCase();
      const receiverName = String(tx.receiver_name || '').toLowerCase();
      const descText = txSignForSelf(tx) < 0
        ? `${_L('ui_to')} ${tx.receiver_name}`.toLowerCase()
        : `${_L('ui_from')} ${tx.sender_name}`.toLowerCase();
      if (senderName.includes(query) || receiverName.includes(query) || descText.includes(query)) {
        return true;
      }


      const amount = toNumber(tx.value || 0);
      const amountStr = String(amount);
      const formattedAmount = formatCurrency(amount).toLowerCase();
      if (amountStr.includes(query) || formattedAmount.includes(query)) {
        return true;
      }


      const dateStr = String(tx.date || '').toLowerCase();
      if (dateStr.includes(query)) {
        return true;
      }


      const m = String(tx.date || '').match(/^(\d{4})\/(\d{2})\/(\d{2})\s*-\s*(\d{2}):(\d{2}):(\d{2})$/);
      if (m) {
        const [, yyyy, mm, dd, HH, MM, SS] = m;
        const d = new Date(`${yyyy}-${mm}-${dd}T${HH}:${MM}`);
        const formattedDate = d.toLocaleDateString(undefined, { month: 'short', day: 'numeric', year: 'numeric' }).toLowerCase();
        const formattedTime = `${HH}:${MM}`.toLowerCase();
        if (formattedDate.includes(query) || formattedTime.includes(query)) {
          return true;
        }
      }


      const sign = txSignForSelf(tx);
      const isOutgoing = sign < 0;
      const sentLabel = (_L('ui_sent') || 'Sent').toLowerCase();
      const receivedLabel = (_L('ui_received') || 'Received').toLowerCase();
      if ((isOutgoing && sentLabel.includes(query)) || (!isOutgoing && receivedLabel.includes(query))) {
        return true;
      }

      return false;
    });
  }


  const total = __txPager.txs.length;
  const totalPages = Math.max(1, Math.ceil(total / TXS_PER_PAGE));
  __txPager.total = total;
  __txPager.totalPages = totalPages;
  __txPager.page = 1;


  showTxPage(1);
}


function updateAccountFilterDropdown() {
  const container = document.querySelector('.custom-select-container.w13');
  if (!container) return;

  const textElement = container.querySelector('.custom-select-text');
  const options = container.querySelectorAll('.custom-select-option');


  const filterTexts = {
    'all': _L('ui_all_accounts'),
    'checking': _L('ui_checking_account'),
    'savings': _L('ui_savings_account')
  };


  if (textElement) {
    textElement.textContent = filterTexts[selectedAccountFilter] || _L('ui_all_accounts');
  }


  options.forEach(opt => {
    opt.classList.remove('selected');
    const onclickAttr = opt.getAttribute('onclick');
    if (onclickAttr) {

      const match = onclickAttr.match(/selectCustomOption\(this,\s*['"](all|checking|savings)['"]\)/);
      if (match && match[1] === selectedAccountFilter) {
        opt.classList.add('selected');
      }
    }
  });
}


function applyAccountFilter() {
  if (!__txPager) return;

  const searchInput = document.getElementById('transactionsSearch');
  const searchQuery = searchInput ? searchInput.value : '';
  filterTransactions(searchQuery);

  updateAccountFilterDropdown();
}

function showTxPage(p) {
  if (!__txPager) return;

  const { txs = [], list } = __txPager;


  const total = txs.length;
  const totalPages = Math.max(1, Math.ceil(total / TXS_PER_PAGE));


  if (!list) return;

  const page = Math.min(Math.max(1, p), totalPages);
  __txPager.page = page;
  __txPager.total = total;
  __txPager.totalPages = totalPages;

  const startIdx = (page - 1) * TXS_PER_PAGE;
  const endIdx = Math.min(startIdx + TXS_PER_PAGE, total);

  if (!total) {

    list.innerHTML = '';
    const itemBody = document.querySelector('.ib-transactions');
    if (itemBody) {
      itemBody.innerHTML = `
        <div class="tr-noinfo">
            <i class="fa-solid fa-clock-rotate-left"></i>
            <div class="cni-ft">${_L('ui_no_transactions_yet')}</div>
            <div class="tni-lt">${_L('ui_transaction_history_help')}</div>
        </div>`;
    }
  } else {

    const itemBody = document.querySelector('.ib-transactions');
    if (itemBody) {

      let transactionsHeader = itemBody.querySelector('.transactions-header');
      let transactionsList = itemBody.querySelector('.transactions-list');
      let transactionsPagination = itemBody.querySelector('.transactions-pagination');

      if (!transactionsHeader || !transactionsList || !transactionsPagination) {

        const existingNoInfo = itemBody.querySelector('.tr-noinfo');
        if (existingNoInfo) {
          existingNoInfo.remove();
        }


        itemBody.innerHTML = `
          <div class="transactions-header">
            <div class="th-type">${_L('ui_type')}</div>
            <div class="th-description">${_L('ui_description')}</div>
            <div class="th-date">${_L('ui_date')}</div>
            <div class="th-amount">${_L('ui_amount')}</div>
            <div class="th-actions">${_L('ui_actions')}</div>
          </div>
          <div class="transactions-list"></div>
          <div class="transactions-pagination">
            <div class="pagination-controls"></div>
          </div>`;


        __txPager.list = itemBody.querySelector('.transactions-list');
        __txPager.pag = itemBody.querySelector('.transactions-pagination');
        transactionsList = __txPager.list;


        if (__txPager.pag && !__txPager.pag.dataset.bound) {
          __txPager.pag.addEventListener('click', (ev) => {
            const btn = ev.target.closest('.pagination-btn');
            if (!btn || btn.disabled) return;
            const pageNum = parseInt(btn.dataset.page, 10);
            if (!isNaN(pageNum)) showTxPage(pageNum);
          });
          __txPager.pag.dataset.bound = '1';
        }
      } else {

        transactionsList.innerHTML = '';
      }


      for (var i = startIdx; i < endIdx; i++) {
        const tx = txs[i];
        const sign = txSignForSelf(tx);
        const outgoing = sign < 0;
        const iconClass = outgoing ? 'outgoing' : 'incoming';
        const iconSymbol = outgoing ? 'fa-solid fa-arrow-down' : 'fa-solid fa-arrow-up';
        const valueClass = outgoing ? 'negative' : 'positive';
        const signTxt = outgoing ? '- ' : '+ ';

        const m = String(tx.date || '').match(/^(\d{4})\/(\d{2})\/(\d{2})\s*-\s*(\d{2}):(\d{2}):(\d{2})$/);
        var dateText = tx.date || '', timeText = '';
        if (m) {
          const [, yyyy, mm, dd, HH, MM, SS] = m;
          const d = new Date(`${yyyy}-${mm}-${dd}T${HH}:${MM}`);
          dateText = d.toLocaleDateString(undefined, { month: 'short', day: 'numeric', year: 'numeric' });
          timeText = `${HH}:${MM}`;
        }

        const descText = outgoing ? `${_L('ui_to')} ${tx.receiver_name}` : `${_L('ui_from')} ${tx.sender_name}`;
        const labelText = outgoing ? _L('ui_sent') : _L('ui_received');

        const row = document.createElement('div');
        row.className = 'transaction-row';
        row.innerHTML = `
          <div class="tr-type">
            <div class="last-transaction-icon ${iconClass}"><i class="${iconSymbol}"></i></div>
          </div>
          <div class="tr-description">
            <div class="last-transaction-info">
              <div class="transaction-text">${limitCharacters(descText, 16)}</div>
              <div class="transaction-label">${labelText}</div>
            </div>
          </div>
          <div class="tr-date">
            <div class="transaction-date">
              <div class="transaction-date-text">${dateText}</div>
              <div class="transaction-time">${timeText}</div>
            </div>
          </div>
          <div class="th-amount">
            <div class="transaction-value ${valueClass}">${signTxt}${formatCurrency(tx.value)}</div>
          </div>
          <div class="th-actions">
            <div class="transaction-actions">
              <div class="card-button cb-t" onclick="openViewTransactionModal(${i})" title="${_L('ui_view_transaction') || 'View Transaction'}"><i class="fa-solid fa-eye"></i></div>
            </div>
          </div>`;
        transactionsList.appendChild(row);
      }
    }
  }


  if (total > 0 && __txPager.pag) {
    const info = __txPager.pag.querySelector('.pagination-info span, .pagination-info');
    if (info) {
      const from = total ? (startIdx + 1) : 0;
      info.textContent = _LF('ui_showing_transactions', from, endIdx, total);
    }


    renderTxPaginationButtons(page, totalPages);
  }
}

function renderTxPaginationButtons(current, total) {
  const controls = __txPager?.pag?.querySelector('.pagination-controls');
  if (!controls) return;

  controls.innerHTML = '';

  const addBtn = (label, page, { disabled = false, active = false, icon = false } = {}) => {
    const b = document.createElement('button');
    b.className = 'pagination-btn' + (active ? ' active' : '');
    if (disabled) b.disabled = true;
    b.dataset.page = page;
    if (icon) b.innerHTML = label; else b.textContent = label;
    controls.appendChild(b);
  };


  addBtn('<i class="fa-solid fa-chevron-left"></i>', current - 1, { disabled: current <= 1, icon: true });


  const nums = [];
  if (total <= 6) {
    for (var i = 1; i <= total; i++) nums.push(i);
  } else {
    nums.push(1);
    if (current > 3) nums.push('…');
    const s = Math.max(2, current - 1);
    const e = Math.min(total - 1, current + 1);
    for (var i = s; i <= e; i++) nums.push(i);
    if (current < total - 2) nums.push('…');
    nums.push(total);
  }

  nums.forEach(n => {
    if (n === '…') {
      const d = document.createElement('button');
      d.className = 'pagination-btn';
      d.disabled = true;
      d.textContent = '...';
      controls.appendChild(d);
    } else {
      addBtn(String(n), n, { active: n === current });
    }
  });


  addBtn('<i class="fa-solid fa-chevron-right"></i>', current + 1, { disabled: current >= total, icon: true });
}

function renderSavingsInfo() {

  let savingsData = null;

  if (openedAccount === 'business') {

    if (societyData && societyData.savings) {
      savingsData = societyData.savings;
    } else {

      savingsData = {
        balance: 0,
        interestRate: 2.0,
        totalEarned: 0,
        thisWeekProjected: 0,
        nextPayoutWhenUtc: ""
      };
    }
  } else if (openedAccount && openedAccount.startsWith('custom_')) {
    if (!customAccountsData || !customAccountsData[0]) {
      return;
    }

    for (let i = 0; i < customAccountsData.length; i++) {
      if (customAccountsData[i].account_identifier === openedAccount.replace('custom_', '')) {
        savingsData = customAccountsData[i].savings;
        break;
      }
    }
    if (!savingsData) {
      return;
    }
  } else {

    if (!window.playerData) {
      return;
    }

    if (!playerData.savings) {
      playerData.savings = {
        balance: 0,
        interestRate: 2.5,
        totalEarned: 0,
        thisWeekProjected: 0,
        nextPayoutWhenUtc: ""
      };
    }
    savingsData = playerData.savings;
  }


  const balEl = document.querySelector('.balance-value');
  if (balEl) {
    balEl.textContent = formatCurrency(savingsData.balance || 0);
  }

  const totalEarned = document.querySelector('.interest-value');
  if (totalEarned) {
    totalEarned.textContent = formatCurrency(savingsData.totalEarned || 0);
    if (savingsData.totalEarned <= 0) {
      totalEarned.style.color = '#fff';
    } else {
      totalEarned.style.color = '#22c55e';
    }
  }

  const periodProjected = document.querySelector('.period-amount');
  if (periodProjected) {
    periodProjected.textContent = formatCurrency(savingsData.thisWeekProjected || 0);
    if (savingsData.thisWeekProjected <= 0) {
      periodProjected.style.color = '#fff';
    } else {
      periodProjected.style.color = '#22c55e';
    }
  }

  const periodDate = document.querySelector('.period-end');
  if (periodDate) {
    periodDate.textContent = formatUtcToDowTime(savingsData.nextPayoutWhenUtc || "", window.okokLangCode);
  }


  const irEls = document.querySelectorAll('.item-interest-tracker .detail-item span');

  if (irEls && irEls.length) {
    for (var i = 0; i < irEls.length - 1; i++) {
      if (irEls[i].textContent && irEls[i].textContent.toLowerCase().includes('interest rate')) {
        irEls[i + 1].textContent = (savingsData.interestRate || 2.5) + '%';
        break;
      }
    }
  }
}

function populateLastSavingsTransactions(transactions) {
  const container = document.querySelector('.ib-lt');
  if (!container) return;

  container.innerHTML = '';

  const txs = Array.isArray(transactions) ? transactions.filter(tx => typeof tx.type === 'string' && tx.type.includes('_savings')) : [];
  if (!txs.length) {
    container.innerHTML = `
      <div class="lt-noinfo">
        <i class="fa-solid fa-receipt"></i>
        <div class="cni-ft">${_L('ui_no_transactions_yet')}</div>
        <div class="cni-lt">${_L('ui_transaction_history_help')}</div>
      </div>`;
    return;
  }

  txs.slice(0, 4).forEach(tx => {
    const sign = txSignForSelf(tx);
    const outgoing = sign < 0;
    const iconClass = outgoing ? 'outgoing' : 'incoming';
    const iconSymbol = outgoing ? 'fa-solid fa-arrow-down' : 'fa-solid fa-arrow-up';
    const valueClass = outgoing ? 'negative' : 'positive';
    const valuePref = outgoing ? '- ' : '+ ';
    const text = outgoing ? `${_L('ui_to')} ${tx.receiver_name}` : `${_L('ui_from')} ${tx.sender_name}`;
    const label = outgoing ? _L('ui_sent') : _L('ui_received');

    const el = document.createElement('div');
    el.className = 'last-transaction';
    el.innerHTML = `
      <div class="last-transaction-icon ${iconClass}"><i class="${iconSymbol}"></i></div>
      <div class="last-transaction-info">
        <div class="last-transaction-text">${limitCharacters(text, 16)}</div>
        <div class="last-transaction-label">${label}</div>
      </div>
      <div class="last-transaction-value ${valueClass}">${valuePref}${formatCurrency(tx.value)}</div>`;
    container.appendChild(el);
  });
}

function populateBalanceChartFromSavingsTransactions(rawTxs) {
  const chart = document.querySelector('.chart');
  const svg = document.getElementById('savingsChart');
  if (!chart || !svg) return;


  var noInfo = chart.querySelector('.chart-noinfo');
  if (!noInfo) {
    noInfo = document.createElement('div');
    noInfo.className = 'chart-noinfo';
    noInfo.innerHTML = `
      <div class="chart-text-group">
        <div class="cni-ft">${_L('ui_no_transaction_history')}</div>
        <div class="cni-lt">${_L('ui_make_first_transaction')}</div>
      </div>
      <div class="chart-divider"></div>`;
    chart.appendChild(noInfo);
  }


  const lineEl = document.getElementById('savingsLinePath');
  const areaEl = document.getElementById('savingsAreaPath');
  const ptsGroup = document.getElementById('savingsPointsGroup');
  const lblContainer = document.getElementById('savingsChartLabels');
  if (lineEl) lineEl.setAttribute('d', '');
  if (areaEl) areaEl.setAttribute('d', '');
  if (ptsGroup) ptsGroup.innerHTML = '';
  if (lblContainer) lblContainer.innerHTML = '';

  const txs = normalizeTransactionsPayload(rawTxs);
  const filteredTxs = Array.isArray(txs) ? txs.filter(tx => typeof tx.type === 'string' && tx.type.includes('_savings')) : [];
  
  let currentBalance = 0;
  if (openedAccount === 'business') {
    if (societyData && societyData.savings) {
      currentBalance = societyData.savings.balance || 0;
    }
  } else if (openedAccount && openedAccount.startsWith('custom_')) {
    const accountIdentifier = openedAccount.replace('custom_', '');
    const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
    if (customAccount && customAccount.savings) {
      currentBalance = customAccount.savings.balance || 0;
    }
  } else {
    if (playerData && playerData.savings) {
      currentBalance = playerData.savings.balance || 0;
    }
  }
  
  const series = buildLast7DaysSavingsSeries(filteredTxs, currentBalance);

  if (series.count === 0) {
    svg.style.display = 'none';
    noInfo.style.display = 'flex';
    return;
  }

  noInfo.style.display = 'none';
  svg.style.display = 'flex';


  const accountId = getCurrentAccountId();
  const shouldAnimate = shouldAnimateChart(accountId, 'savings');


  lastRenderedSavingsAccount = accountId;


  requestAnimationFrame(() => {
    renderSavingsBalanceChart(series.labels, series.data, shouldAnimate);
  });
}


function getCachedSavingsGoals() {
  const cacheKey = openedAccount || 'personal';
  return cachedSavingsGoals[cacheKey] || null;
}


function setCachedSavingsGoals(goals) {
  const cacheKey = openedAccount || 'personal';
  cachedSavingsGoals[cacheKey] = goals;
}


async function preloadSavingsGoals() {
  const cached = getCachedSavingsGoals();
  if (cached !== null) return cached;

  try {
    const response = await fetch(`https://${GetParentResourceName()}/getSavingsGoals`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ openedAccount: openedAccount })
    });
    const data = await response.json();
    const goals = Array.isArray(data.goals) ? data.goals : [];
    setCachedSavingsGoals(goals);
    return goals;
  } catch (e) {
    console.error('Error preloading savings goals:', e);
    return [];
  }
}


async function fetchAndRenderSavingsGoals() {
  try {
    const response = await fetch(`https://${GetParentResourceName()}/getSavingsGoals`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ openedAccount: openedAccount })
    });
    const data = await response.json();
    const goals = Array.isArray(data.goals) ? data.goals : [];
    setCachedSavingsGoals(goals);
    renderSavingsGoals(goals);
  } catch (e) {
    console.error('Error fetching savings goals:', e);
    renderSavingsGoals([]);

    const createBtn = document.getElementById('createNewGoalButton');
    if (createBtn) {
      createBtn.disabled = false;
      createBtn.removeAttribute('style');
    }
  }
}


function renderSavingsGoals(goals) {
  const container = document.querySelector('.saving-goals-list');
  if (!container) return;


  const activeGoalsCount = goals ? goals.filter(goal => !goal.is_completed).length : 0;


  const maxGoals = (openedAccount === 'business') ? businessMaxActiveGoals : maxActiveGoals;
  const createBtn = document.getElementById('createNewGoalButton');
  if (createBtn) {
    if (activeGoalsCount >= maxGoals) {
      createBtn.disabled = true;
      createBtn.style.opacity = '0.5';
      createBtn.style.cursor = 'default';
      createBtn.style.color = '#fff';
    } else {
      createBtn.disabled = false;
      createBtn.removeAttribute('style');
    }
  }

  if (goals.length > 3) {
    container.style.paddingRight = '0.375rem';
  } else {
    container.style.paddingRight = '0.625rem';
  }

  if (!goals || goals.length === 0) {
    container.innerHTML = `
    <div class="sg-noinfo">
        <i class="fa-solid fa-bullseye"></i>
        <div class="cni-ft">${_L('ui_no_saving_goals')}</div>
        <div class="cni-lt">${_L('ui_create_first_goal')}</div>
    </div>`;

    updateGoalsScroll();
    return;
  }

  container.innerHTML = goals.map(goal => {
    const balance = toNumber(goal.balance || 0);
    const target = toNumber(goal.target_amount || 0);
    const remaining = Math.max(0, target - balance);
    const progressPct = target > 0 ? Math.min(100, Math.floor((balance / target) * 100)) : 0;
    const isCompleted = goal.is_completed || false;


    const goalData = JSON.stringify({
      id: goal.id,
      goal_name: goal.goal_name || 'Goal',
      target_amount: target,
      balance: balance,
      interest_total: toNumber(goal.interest_total || 0),
      is_completed: isCompleted,
      created_at: goal.created_at,
      completed_at: goal.completed_at
    });
    const goalDataEscaped = goalData.replace(/"/g, '&quot;');

    return `
      <div class="saving-goal-item" data-goal-id="${goal.id}">
        <button class="goal-manage-btn" data-goal-data="${goalDataEscaped}">${_L('ui_manage')}</button>
        <div class="saving-goal-info">
          <div class="saving-goal-header">
            <div class="saving-goal-title">${escapeHTML(goal.goal_name || _L('ui_goal'))}</div>
            <div class="saving-goal-amount">${formatCurrency(balance)}</div>
          </div>
          <div class="saving-goal-meta">
            <span class="goal-target-amount">${_L('ui_goal')}: ${formatCurrency(target)}</span>
          </div>
        </div>
        <div class="saving-goal-progress">
          <div class="sg-progress-bar">
            <div class="sg-progress-fill" style="width: ${progressPct}%;"></div>
          </div>
          <div class="sg-progress-bottom">
            <div class="sg-remaining-amount">${isCompleted ? _L('ui_completed') : formatCurrency(remaining) + ' ' + _L('ui_remaining')}</div>
            <div class="sg-progress-text">${progressPct}% ${_L('ui_complete')}</div>
          </div>
        </div>
      </div>`;
  }).join('');


  updateGoalsScroll();
}


function updateGoalsScroll() {
  const list = document.querySelector('.saving-goals-list');
  if (!list) return;


  const goalItems = list.querySelectorAll('.saving-goal-item');
  const itemCount = goalItems.length;


  if (itemCount <= 3) {
    list.style.overflowY = 'hidden';
    return;
  }


  const hasOverflow = list.scrollHeight > list.clientHeight;
  list.style.overflowY = hasOverflow ? 'auto' : 'hidden';
}


window.addEventListener('resize', updateGoalsScroll);


function populateManageGoalModal(goal) {
  const modal = document.getElementById('manageGoalModal');
  if (!modal || !goal) return;


  const titleEl = modal.querySelector('.modal-t');
  if (titleEl) {
    titleEl.textContent = `${_L('ui_manage_saving_goal')}: ${goal.goal_name || _L('ui_goal')}`;
  }


  const balance = toNumber(goal.balance || 0);
  const target = toNumber(goal.target_amount || 0);
  const remaining = Math.max(0, target - balance);
  const progressPct = target > 0 ? Math.min(100, Math.floor((balance / target) * 100)) : 0;
  const isCompleted = goal.is_completed || false;


  const goalValueEl = modal.querySelector('.goal-summary-item .gsi-group:nth-child(1) .gsi-value');
  if (goalValueEl) goalValueEl.textContent = formatCurrency(target);

  const progressBarEl = modal.querySelector('.goal-summary-item .sg-progress-bar .sg-progress-fill');
  if (progressBarEl) progressBarEl.style.width = progressPct + '%';

  const savedValueEl = modal.querySelector('.goal-summary-item .gsi-group:nth-child(3) .gsi-value-blue');
  if (savedValueEl) {
    savedValueEl.innerHTML = `${formatCurrency(balance)} <span class="gsi-progress">(${progressPct}%)</span>`;
  }


  modal.setAttribute('data-goal-id', goal.id || '');
  modal.setAttribute('data-goal-data', JSON.stringify(goal));
}


$(document).on('click', '.goal-manage-btn', function () {
  const goalDataStr = this.getAttribute('data-goal-data');
  if (!goalDataStr) return;

  try {
    const goal = JSON.parse(goalDataStr);
    const modal = document.getElementById('manageGoalModal');
    if (!modal) return;


    populateManageGoalModal(goal);


    modal.style.display = 'flex';
    setTimeout(() => modal.classList.add('show'), 50);
  } catch (e) {
    console.error('Error parsing goal data:', e);
  }
});


$(document).on('click', '#addToGoalBtn', async function () {
  const modal = document.getElementById('manageGoalModal');
  if (!modal) return;

  const goalId = modal.getAttribute('data-goal-id');
  const inputEl = document.getElementById('addToGoalAmount');
  if (!goalId || !inputEl) {
    console.error('Missing goal ID or input element');
    return;
  }

  const depositAmount = parseFloat(inputEl.value.replace(/[^\d.,]/g, '').replace(',', '.')) || 0;
  if (depositAmount <= 0) {
    return;
  }


  const goalDataStr = modal.getAttribute('data-goal-data');
  if (goalDataStr) {
    try {
      const goal = JSON.parse(goalDataStr);
      if (goal.is_completed) {
        return;
      }
      const remaining = toNumber(goal.target_amount || 0) - toNumber(goal.balance || 0);
      if (depositAmount > remaining) {

        inputEl.value = remaining;
        depositAmount = remaining;
      }
    } catch (e) {
      console.error('Error parsing goal data:', e);
    }
  }


  const btn = this;
  btn.disabled = true;

  try {
    const finalAmount = parseFloat(inputEl.value.replace(/[^\d.,]/g, '').replace(',', '.')) || 0;
    const response = await fetch(`https://${GetParentResourceName()}/addToSavingsGoal`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ goalId: parseInt(goalId), amount: finalAmount, openedAccount: openedAccount })
    });

    const data = await response.json();

    if (data.success) {

      if (data.result && data.result.bankBalance !== undefined) {

        if (openedAccount === 'business' && societyData) {
          societyData.value = data.result.bankBalance;
        } else if (openedAccount && openedAccount.startsWith('custom_')) {
          const accountIdentifier = openedAccount.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            accounts[openedAccount].accountData.balance = data.result.bankBalance;
            accounts[openedAccount].accountData.transactions = Array.isArray(data.result.transactions) ? data.result.transactions : [];
          }
        } else {
          playerData.playerBankMoney = data.result.bankBalance;
        }

        if (currentAccountType !== 'savings') {
          updatePlayerMoney(data.result.bankBalance);
        }

      }


      if (data.result && data.result.transactions) {
        const normalizedTxs = normalizeTransactionsPayload(data.result.transactions);
        setActiveTransactions(normalizedTxs);
        applyCurrentAccountToUI();
      }


      inputEl.value = '';


      await fetchAndRenderSavingsGoals();


      if (data.result && data.result.goal) {
        populateManageGoalModal(data.result.goal);
      }
    }
  } finally {

    btn.disabled = false;
  }
});


$(document).on('click', '#withdrawGoalFundsBtn', async function () {
  const modal = document.getElementById('manageGoalModal');
  if (!modal) return;

  const goalId = modal.getAttribute('data-goal-id');
  if (!goalId) {
    console.error('Missing goal ID');
    return;
  }


  const goalDataStr = modal.getAttribute('data-goal-data');
  let balance = 0;
  if (goalDataStr) {
    try {
      const goal = JSON.parse(goalDataStr);
      balance = toNumber(goal.balance || 0);
    } catch (e) {
      console.error('Error parsing goal data:', e);
    }
  }

  if (balance <= 0) {
    return;
  }


  const btn = this;
  btn.disabled = true;

  try {
    const response = await fetch(`https://${GetParentResourceName()}/withdrawSavingsGoal`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ goalId: parseInt(goalId), openedAccount: openedAccount })
    });

    const data = await response.json();

    if (data.success) {

      if (data.result && data.result.bankBalance !== undefined) {

        if (openedAccount === 'business' && societyData) {
          societyData.value = data.result.bankBalance;
        } else if (openedAccount && openedAccount.startsWith('custom_')) {
          const accountIdentifier = openedAccount.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            accounts[openedAccount].accountData.balance = data.result.bankBalance;
            accounts[openedAccount].accountData.transactions = Array.isArray(data.result.transactions) ? data.result.transactions : [];
          }
        } else {
          playerData.playerBankMoney = data.result.bankBalance;
        }

        if (currentAccountType !== 'savings') {
          updatePlayerMoney(data.result.bankBalance);
        }

      }


      if (data.result && data.result.transactions) {
        const normalizedTxs = normalizeTransactionsPayload(data.result.transactions);
        setActiveTransactions(normalizedTxs);
        applyCurrentAccountToUI();
      }


      modal.classList.remove('show');
      setTimeout(() => {
        modal.style.display = 'none';

        const inputEl = document.getElementById('addToGoalAmount');
        if (inputEl) inputEl.value = '';
      }, 300);


      await fetchAndRenderSavingsGoals();
    }
  } finally {

    btn.disabled = false;
  }
});


function validateCreateGoalButton() {
  const goalName = document.getElementById('goalName')?.value?.trim() || '';
  const targetAmount = document.getElementById('targetAmount')?.value?.trim() || '';
  const initialDeposit = document.getElementById('initialDeposit')?.value?.trim() || '';
  const createBtn = document.getElementById('createNewGoalBtn');

  if (createBtn) {
    const isValid = goalName.length > 0 && targetAmount.length > 0 && initialDeposit.length > 0;
    createBtn.disabled = !isValid;
    createBtn.style.opacity = isValid ? '1' : '0.5';
    createBtn.style.cursor = isValid ? 'pointer' : 'default';
  }
}


$(document).on('input', '#goalName, #targetAmount, #initialDeposit', function () {
  validateCreateGoalButton();
});

$(document).on('click', '#createNewGoalBtn', async function () {
  const btn = this;
  if (btn.disabled) return;

  const goalName = document.getElementById('goalName').value.trim();
  const targetAmount = parseFloat(document.getElementById('targetAmount').value.replace(/[^\d.,]/g, '').replace(',', '.')) || 0;
  const initialDeposit = parseFloat(document.getElementById('initialDeposit').value.replace(/[^\d.,]/g, '').replace(',', '.')) || 0;

  if (!goalName || targetAmount <= 0 || initialDeposit < 0) {
    return;
  }


  btn.disabled = true;

  try {
    const response = await fetch(`https://${GetParentResourceName()}/createSavingsGoal`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ goalName, targetAmount, initialDeposit, openedAccount: openedAccount })
    });

    const data = await response.json();

    if (data.success) {

      if (data.result && data.result.bankBalance !== undefined) {

        if (openedAccount === 'business' && societyData) {
          societyData.value = data.result.bankBalance;
        } else if (openedAccount && openedAccount.startsWith('custom_')) {
          const accountIdentifier = openedAccount.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            accounts[openedAccount].accountData.balance = data.result.bankBalance;
            accounts[openedAccount].accountData.transactions = Array.isArray(data.result.transactions) ? data.result.transactions : [];
          }
        } else {
          playerData.playerBankMoney = data.result.bankBalance;
        }

        if (currentAccountType !== 'savings') {
          updatePlayerMoney(data.result.bankBalance);
        }

      }


      if (data.result && data.result.transactions) {
        const normalizedTxs = normalizeTransactionsPayload(data.result.transactions);
        setActiveTransactions(normalizedTxs);
        applyCurrentAccountToUI();
      }


      document.getElementById('goalName').value = '';
      document.getElementById('targetAmount').value = '';
      document.getElementById('initialDeposit').value = '';


      const modal = document.getElementById('createNewGoalModal');
      if (modal) {
        modal.classList.remove('show');
        setTimeout(() => {
          modal.style.display = 'none';
        }, 300);
      }


      await fetchAndRenderSavingsGoals();
    } else {
      console.error('Failed to create goal:', data.reason || 'unknown_error');
    }
  } finally {

    validateCreateGoalButton();
  }
});


const BILLS_PER_PAGE = 6;
var __billPager = null;
var __contactsFilter = null;

function getActiveBills() {
  return currentAccountType === 'business' ? (societyBills || []) : (playerBills || []);
}

function payAllBills() {

  const allBills = getActiveBills();


  const unpaidBills = allBills.filter(bill => {
    const status = String(bill.status || '').toLowerCase();
    return status !== 'paid';
  });


  if (unpaidBills.length === 0) {


    return;
  }


  let total = 0;
  unpaidBills.forEach(bill => {
    const invoiceValue = toNumber(bill.invoice_value || 0);
    total += invoiceValue;
  });


  const confirmText = `Are you sure you want to pay all <span class="bold">${unpaidBills.length}</span> invoice${unpaidBills.length !== 1 ? 's' : ''}?<br>Total amount: <span class="bold">${formatCurrency(total)}</span>`;


  const modalTitle = document.querySelector('#confirmCancelModal .modal-t');
  if (modalTitle) {
    modalTitle.textContent = _L('ui_pay_all_bills');
  }


  const unpaidBillRefs = unpaidBills.map(bill => bill.ref_id || bill.id);


  openConfirmModal(
    confirmText,
    _L('ui_pay_all'),
    'blue',
    function () {

      fetch(`https://${GetParentResourceName()}/payAllBills`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({})
      })
        .then(r => r.json())
        .then(data => {
          closeConfirmModal();
          if (data.success) {

            if (data.bankMoney !== undefined) {
              playerData.playerBankMoney = data.bankMoney;
              updatePlayerMoney(data.bankMoney);
            }


            if (data.transactions) {
              const normalizedTxs = normalizeTransactionsPayload(data.transactions);
              setActiveTransactions(normalizedTxs);
              if (currentPage === 'overview') {
                populateLastTransactions(normalizedTxs);
              }
            }


            if (currentPage === 'bills') {

              const billsToUpdate = currentAccountType === 'business' ? societyBills : playerBills;
              unpaidBillRefs.forEach(refId => {
                const billIndex = billsToUpdate.findIndex(b => (b.ref_id || b.id) === refId);
                if (billIndex !== -1) {
                  billsToUpdate[billIndex].status = 'paid';
                  billsToUpdate[billIndex].paid_date = billsToUpdate[billIndex].limit_pay_date || new Date().toISOString();
                }
              });

              loadAllBills();
            }
          } else {

            console.error('Failed to pay bills:', data.message);
          }
        })
        .catch(error => {
          closeConfirmModal();
          console.error('Error paying bills:', error);
        });
    }
  );
}

function loadAllBills(preloaded) {
  const bills = Array.isArray(preloaded) ? preloaded : getActiveBills();
  __billPager = { ...(__billPager || {}), bills, originalBills: bills };
  initBillsPager();
}

function initBillsPager() {
  const bills = Array.isArray(__billPager?.bills) ? __billPager.bills : getActiveBills();
  const total = bills.length;
  const totalPages = Math.max(1, Math.ceil(total / BILLS_PER_PAGE));


  __billPager = { ...__billPager, bills, total, totalPages, page: 1, originalBills: bills };


  const list = document.querySelector('.bills-list');
  const pag = document.querySelector('.bills-pagination');

  if (list && pag) {

    __billPager.list = list;
    __billPager.pag = pag;

    if (!pag.dataset.bound) {
      pag.addEventListener('click', (e) => {
        const btn = e.target.closest('.pagination-btn');
        if (!btn || !btn.dataset.page) return;
        const n = parseInt(btn.dataset.page, 10);
        if (Number.isFinite(n)) showBillPage(n);
      });
      pag.dataset.bound = '1';
    }
  }


  const searchInput = document.getElementById('billsSearch');
  if (searchInput && !searchInput.dataset.bound) {
    searchInput.addEventListener('input', (e) => {
      filterBills(e.target.value);
    });
    searchInput.dataset.bound = '1';
  }

  showBillPage(1);
}


function filterBills(searchQuery) {
  if (!__billPager) return;

  const query = String(searchQuery || '').trim().toLowerCase();
  const originalBills = __billPager.originalBills || __billPager.bills || getActiveBills();

  if (!query) {

    __billPager.bills = originalBills;
  } else {

    __billPager.bills = originalBills.filter(bill => {

      const status = String(bill.status || '').toLowerCase();
      const statusLabel = status === 'paid' ? (_L('ui_paid') || 'Paid').toLowerCase() : (_L('ui_unpaid') || 'Unpaid').toLowerCase();
      if (statusLabel.includes(query) || status.includes(query)) {
        return true;
      }


      const author = String(bill.author_name || bill.society_name || bill.item || '').toLowerCase();
      if (author.includes(query)) {
        return true;
      }


      const amount = toNumber(bill.invoice_value || 0);
      const amountStr = String(amount);
      const formattedAmount = formatCurrency(amount).toLowerCase();
      if (amountStr.includes(query) || formattedAmount.includes(query)) {
        return true;
      }

      return false;
    });
  }


  const total = __billPager.bills.length;
  const totalPages = Math.max(1, Math.ceil(total / BILLS_PER_PAGE));
  __billPager.total = total;
  __billPager.totalPages = totalPages;
  __billPager.page = 1;


  showBillPage(1);
}

function showBillPage(page) {
  if (!__billPager) return;

  const { bills = [], totalPages, list } = __billPager;
  const total = bills.length;


  if (!list) return;

  const p = Math.min(Math.max(page, 1), totalPages);
  __billPager.page = p;

  const payAllBtn = document.querySelector('.pay-all-bills');
  if (payAllBtn) {
    if (!total) {
      payAllBtn.style.opacity = '0.5';
      payAllBtn.style.cursor = 'default';
      payAllBtn.style.pointerEvents = 'none';
    } else {
      payAllBtn.style.opacity = '1';
      payAllBtn.style.cursor = 'pointer';
      payAllBtn.style.pointerEvents = 'auto';
    }
  }

  if (!total) {

    list.innerHTML = '';
    const itemBody = document.querySelector('.ib-bills');
    if (itemBody) {
      itemBody.innerHTML = `
        <div class="tr-noinfo">
          <i class="fa-solid fa-file-invoice-dollar"></i>
          <div class="cni-ft">${_L('ui_no_bills') || 'No bills yet'}</div>
          <div class="tni-lt">${_L('ui_bills_help') || 'Your bills history will appear here'}</div>
        </div>`;
    }
    return;
  } else {

    const itemBody = document.querySelector('.ib-bills');
    if (itemBody) {

      let billsHeader = itemBody.querySelector('.bills-header');
      let billsList = itemBody.querySelector('.bills-list');
      let billsPagination = itemBody.querySelector('.bills-pagination');

      if (!billsHeader || !billsList || !billsPagination) {

        const existingNoInfo = itemBody.querySelector('.tr-noinfo');
        if (existingNoInfo) {
          existingNoInfo.remove();
        }


        itemBody.innerHTML = `
          <div class="bills-header">
            <div class="th-type-b">#</div>
            <div class="th-description-b">${_L('ui_status')}</div>
            <div class="th-date-b">${_L('ui_author')}</div>
            <div class="th-amount-b">${_L('ui_amount')}</div>
            <div class="th-actions-b">${_L('ui_actions')}</div>
          </div>
          <div class="bills-list"></div>
          <div class="bills-pagination">
            <div class="pagination-controls"></div>
          </div>`;


        __billPager.list = itemBody.querySelector('.bills-list');
        __billPager.pag = itemBody.querySelector('.bills-pagination');
        billsList = __billPager.list;
        billsPagination = __billPager.pag;


        if (__billPager.pag && !__billPager.pag.dataset.bound) {
          __billPager.pag.addEventListener('click', (ev) => {
            const btn = ev.target.closest('.pagination-btn');
            if (!btn || btn.disabled) return;
            const pageNum = parseInt(btn.dataset.page, 10);
            if (!isNaN(pageNum)) showBillPage(pageNum);
          });
          __billPager.pag.dataset.bound = '1';
        }
      } else {

        billsList.innerHTML = '';
      }
    }
  }


  const billsList = __billPager.list;
  const billsPagination = __billPager.pag;

  if (!billsList) return;

  const start = (p - 1) * BILLS_PER_PAGE;
  const end = Math.min(start + BILLS_PER_PAGE, bills.length);
  const slice = bills.slice(start, end);

  slice.forEach((b, i) => {
    const id = b.id ?? (start + i + 1);
    const amount = toNumber(b.invoice_value);


    const s = String(b.status || '').toLowerCase();
    var statusClass = 'unpaid', statusLabel = _L('ui_unpaid') || 'Unpaid', icon = 'fa-solid fa-circle-xmark';
    if (s === 'paid') {
      statusClass = 'paid'; statusLabel = _L('ui_paid') || 'Paid'; icon = 'fa-solid fa-circle-check';
    }

    const author = b.author_name || b.society_name || b.item || 'N/A';

    var dateStr = b.sent_date || b.limit_pay_date || '';
    var billDateText = dateStr;

    var m = String(dateStr).match(/^(\d{4})[\/-](\d{2})[\/-](\d{2})(?:\s*-\s*(\d{2}):(\d{2}):(\d{2}))?/);
    if (m) {
      const [, yyyy, mm, dd] = m;

      const locale = (window.okokLangCode || navigator.language || 'en-US');
      const d = new Date(`${yyyy}-${mm}-${dd}`);
      billDateText = d.toLocaleDateString(locale, { month: 'short', day: 'numeric', year: 'numeric' });
    }

    const row = document.createElement('div');
    row.className = 'bill-row';
    row.dataset.billIndex = start + i;
    row.innerHTML = `
      <div class="tr-type-b"><div class="bill-id">${id}</div></div>
      <div class="tr-description-b">
        <div class="bill-status">
          <div class="status-icon ${statusClass}"><i class="${icon}"></i></div>
        </div>
      </div>
      <div class="tr-date-b">
        <div class="bill-author">
          <div class="author-name">${author}</div>
          <div class="bill-date">${billDateText}</div>
        </div>
      </div>
      <div class="tr-amount-b">
        <div class="bill-value negative">${formatCurrency(amount)}</div>
      </div>
      <div class="tr-actions-b">
        <div class="bills-actions">
          <div class="card-button cb-t view-bill" title="${_L('ui_view_bill')}"><i class="fa-solid fa-eye"></i></div>
        </div>
      </div>`;
    billsList.appendChild(row);
  });


  const makeBtn = (label, pageNum, active = false, disabled = false) => {
    const b = document.createElement('button');
    b.className = 'pagination-btn' + (active ? ' active' : '');
    b.innerHTML = label;
    b.disabled = !!disabled;
    if (!disabled) b.dataset.page = String(pageNum);
    return b;
  };

  const dot = () => {
    const b = document.createElement('button');
    b.className = 'pagination-btn';
    b.textContent = '.';
    b.disabled = true;
    return b;
  };

  const controls = document.createElement('div');
  controls.className = 'pagination-controls';
  controls.appendChild(makeBtn('<i class="fa-solid fa-chevron-left"></i>', p - 1, false, p <= 1));

  if (totalPages <= 7) {
    for (var n = 1; n <= totalPages; n++) controls.appendChild(makeBtn(String(n), n, n === p));
  } else {
    controls.appendChild(makeBtn('1', 1, p === 1));
    if (p > 3) controls.appendChild(dot());
    for (var n = Math.max(2, p - 1); n <= Math.min(totalPages - 1, p + 1); n++) {
      controls.appendChild(makeBtn(String(n), n, n === p));
    }
    if (p < totalPages - 2) controls.appendChild(dot());
    controls.appendChild(makeBtn(String(totalPages), totalPages, p === totalPages));
  }

  controls.appendChild(makeBtn('<i class="fa-solid fa-chevron-right"></i>', p + 1, false, p >= totalPages));

  if (billsPagination) {
    billsPagination.innerHTML = '';
    billsPagination.appendChild(controls);
  }


  billsList.querySelectorAll('.view-bill').forEach((btn, idx) => {
    btn.addEventListener('click', () => {
      const row = btn.closest('.bill-row');
      const billIndex = parseInt(row.dataset.billIndex, 10);
      if (Number.isFinite(billIndex) && __billPager.bills[billIndex]) {
        openReceiptModal(__billPager.bills[billIndex]);
      }
    });
  });
}


function formatBillDate(dateStr) {
  if (!dateStr) return '';

  const m = String(dateStr).match(/^(\d{4})[\/-](\d{2})[\/-](\d{2})(?:\s*[-T]\s*(\d{2}):(\d{2}):(\d{2}))?/);
  if (m) {
    const [, yyyy, mm, dd, hh, min, ss] = m;
    const dateStrFormatted = `${yyyy}-${mm}-${dd}${hh ? `T${hh}:${min || '00'}:${ss || '00'}` : ''}`;
    const d = new Date(dateStrFormatted);


    const monthNames = ['January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'];
    const monthName = monthNames[parseInt(mm, 10) - 1];


    const day = parseInt(dd, 10);
    const year = parseInt(yyyy, 10);

    if (hh && min) {

      const timePart = `${String(hh).padStart(2, '0')}:${String(min).padStart(2, '0')}`;
      return `${day} ${monthName} ${year}, ${timePart}`;
    } else {

      return `${day} ${monthName} ${year}`;
    }
  }
  return dateStr;
}


function openReceiptModal(bill) {
  const modal = document.getElementById('viewBillModal');
  if (!modal) return;


  const billId = bill.id || 'N/A';
  const status = String(bill.status || '').toLowerCase();
  const isPaid = status === 'paid';
  const invoiceValue = toNumber(bill.invoice_value || 0);
  const vatAmount = Math.round(invoiceValue * (vatPercent / 100));
  const subtotal = invoiceValue - vatAmount;
  const refId = bill.ref_id || bill.id || 'N/A';
  const sentDate = formatBillDate(bill.sent_date);
  const dueDate = formatBillDate(bill.limit_pay_date);
  const paidDate = formatBillDate(bill.paid_date || bill.limit_pay_date);
  const receiverName = bill.receiver_name || 'N/A';
  const senderName = bill.author_name || bill.society_name || bill.item || 'N/A';
  const item = bill.item || 'N/A';
  const notes = bill.notes || 'N/A';


  const modalTitle = document.getElementById('bill-modal-title');
  if (modalTitle) {
    modalTitle.textContent = `${_L('ui_invoice')} #${billId}`;
  }


  const statusEl = document.getElementById('bill-modal-status');
  if (statusEl) {
    statusEl.className = `receipt-status ${isPaid ? 'active' : 'blocked'}`;
    statusEl.textContent = isPaid ? (_L('ui_paid') || 'Paid') : (_L('ui_unpaid') || 'Unpaid');
  }


  const refIdEl = document.getElementById('bill-modal-refid');
  if (refIdEl) {
    refIdEl.textContent = `${_L('ui_reference_id')}: ${refId}`;
  }


  const sentDateEl = document.getElementById('bill-modal-sent-date');
  if (sentDateEl) {
    sentDateEl.textContent = sentDate || 'N/A';
  }
  const dueDateEl = document.getElementById('bill-modal-due-date');
  if (dueDateEl) {
    dueDateEl.textContent = dueDate || 'N/A';
  }


  const toEl = document.getElementById('bill-modal-to');
  if (toEl) {
    toEl.textContent = receiverName;
  }
  const fromEl = document.getElementById('bill-modal-from');
  if (fromEl) {
    fromEl.textContent = senderName;
  }


  const notesEl = document.getElementById('bill-modal-notes');
  if (notesEl) {
    notesEl.textContent = notes || 'N/A';
  }


  const itemNameEl = document.getElementById('bill-modal-item-name');
  if (itemNameEl) {
    itemNameEl.textContent = item;
  }
  const itemValueEl = document.getElementById('bill-modal-item-value');
  if (itemValueEl) {
    itemValueEl.textContent = formatCurrency(subtotal);
  }


  const subtotalEl = document.getElementById('bill-modal-subtotal');
  if (subtotalEl) {
    subtotalEl.textContent = formatCurrency(subtotal);
  }


  const vatValueEl = document.getElementById('bill-modal-vat-value');
  if (vatValueEl) {
    vatValueEl.textContent = formatCurrency(vatAmount);
  }
  const vatLabelEl = document.getElementById('bill-modal-vat-label');
  if (vatLabelEl) {
    vatLabelEl.textContent = `${_L('ui_vat')} (${vatPercent}%)`;
  }


  const totalEl = document.getElementById('receipt-modal-total');
  if (totalEl) {
    totalEl.textContent = formatCurrency(invoiceValue);
  }


  const paidDateEl = document.getElementById('bill-modal-paid-date');
  if (paidDateEl) {
    if (isPaid && paidDate) {
      paidDateEl.textContent = `${_L('ui_paid_on')} ${paidDate}`;
      paidDateEl.style.display = 'flex';
    } else {
      paidDateEl.style.display = 'none';
    }
  }


  const payButton = document.getElementById('paybill_btn');
  if (payButton) {
    if (isPaid) {
      payButton.style.display = 'none';
    } else {
      payButton.style.display = 'flex';

      payButton._billData = bill;
    }
  }


  const printReceiptButton = document.getElementById('print_receipt_btn');
  if (printReceiptButton) {
    if (isPaid && inventoryWithMetadata) {
      printReceiptButton.style.display = 'flex';

      printReceiptButton._billRefId = refId;
    } else {
      printReceiptButton.style.display = 'none';
    }
  }


  modal.style.display = 'flex';
  setTimeout(() => {
    modal.classList.add('show');
  }, 10);
}


function openViewTransactionModal(transactionIndex) {
  const modal = document.getElementById('viewTransactionModal');
  if (!modal) return;
  var transaction = __txPager.txs[transactionIndex];


  const modalTitle = modal.querySelector('.modal-t');
  if (modalTitle) modalTitle.textContent = _L('ui_transaction_details');


  const infoRows = modal.querySelectorAll('.transaction-modal-info');
  const labelKeys = ['ui_type', 'ui_status', 'ui_date', 'ui_from', 'ui_sender_iban', 'ui_to', 'ui_receiver_iban'];
  infoRows.forEach((row, index) => {
    const label = row.querySelector('div:first-child');
    if (label && labelKeys[index]) label.textContent = _L(labelKeys[index]) + ':';
  });


  const totalRow = modal.querySelector('.transaction-modal-total div:first-child');
  if (totalRow) totalRow.textContent = _L('ui_total');


  const printBtn = modal.querySelector('#printreceipt_btn');
  if (printBtn) {
    printBtn.textContent = _L('ui_print_receipt');
    if (!inventoryWithMetadata) {
      printBtn.style.display = 'none';
    }
  }


  const accountType = currentAccountType === 'business' ? 'business' : 'personal';
  const activeEntity = getActiveEntity();
  const accountIdentifier = activeEntity.citizenId || '';

  fetch(`https://${GetParentResourceName()}/getTransactionInformation`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({
      transaction: transaction,
      accountType: accountType,
      accountIdentifier: accountIdentifier
    })
  })
    .then(r => r.json())
    .then(data => {
      if (data.success && data.data) {
        const txInfo = data.data;


        let formattedDate = txInfo.transaction_date || '';
        const dateMatch = String(txInfo.transaction_date || '').match(/^(\d{4})\/(\d{2})\/(\d{2})\s*-\s*(\d{2}):(\d{2}):(\d{2})$/);
        if (dateMatch) {
          const [, yyyy, mm, dd, HH, MM, SS] = dateMatch;
          const d = new Date(`${yyyy}-${mm}-${dd}T${HH}:${MM}:${SS}`);
          const monthNames = ['January', 'February', 'March', 'April', 'May', 'June',
            'July', 'August', 'September', 'October', 'November', 'December'];
          const monthName = monthNames[parseInt(mm, 10) - 1];
          const day = parseInt(dd, 10);
          const year = parseInt(yyyy, 10);
          const timePart = `${String(HH).padStart(2, '0')}:${String(MM).padStart(2, '0')}`;
          formattedDate = `${day} ${monthName} ${year}, ${timePart}`;
        }


        const typeEl = document.getElementById('transaction-modal-type');
        if (typeEl) {
          typeEl.textContent = txInfo.transaction_type || 'Transaction';
        }

        const dateEl = document.getElementById('transaction-modal-date');
        if (dateEl) {
          dateEl.textContent = formattedDate;
        }

        const fromEl = document.getElementById('transaction-modal-from');
        if (fromEl) {
          fromEl.textContent = txInfo.transaction_from || 'N/A';
        }

        const senderIbanEl = document.getElementById('transaction-modal-sender-iban');
        if (senderIbanEl) {
          const iban = txInfo.transaction_sender_iban || 'N/A';
          senderIbanEl.textContent = iban;
          if (iban === 'N/A') {
            senderIbanEl.style.fontFamily = 'tajawal';
          } else {
            senderIbanEl.style.fontFamily = '';
          }
        }

        const toEl = document.getElementById('transaction-modal-to');
        if (toEl) {
          toEl.textContent = txInfo.transaction_to || 'N/A';
        }

        const receiverIbanEl = document.getElementById('transaction-modal-receiver-iban');
        if (receiverIbanEl) {
          const iban = txInfo.transaction_receiver_iban || 'N/A';
          receiverIbanEl.textContent = iban;
          if (iban === 'N/A') {
            receiverIbanEl.style.fontFamily = 'tajawal';
          } else {
            receiverIbanEl.style.fontFamily = '';
          }
        }

        const totalEl = document.getElementById('transaction-modal-total');
        if (totalEl) {
          const value = toNumber(txInfo.transaction_value || 0);
          totalEl.textContent = formatCurrency(value);
        }

        const printReceiptBtn = document.getElementById('printreceipt_btn');
        if (printReceiptBtn) {
          if (inventoryWithMetadata) {
            printReceiptBtn.style.display = 'flex';
            printReceiptBtn._txInfo = txInfo;
          } else {
            printReceiptBtn.style.display = 'none';
          }
        }


        modal.style.display = 'flex';
        setTimeout(() => {
          modal.classList.add('show');
        }, 10);
      }
    });
}


function paySingleBill(bill) {
  if (!bill) return;

  const totalAmount = toNumber(bill.invoice_value || 0);


  const confirmText = `${_L('ui_are_you_sure_pay_bill')}<br>${_L('ui_price')}: <span class="bold">${formatCurrency(totalAmount)}</span>`;


  const modalTitle = document.querySelector('#confirmCancelModal .modal-t');
  if (modalTitle) {
    modalTitle.textContent = _L('ui_pay_bill');
  }


  openConfirmModal(
    confirmText,
    _L('ui_pay'),
    'blue',
    function () {

      fetch(`https://${GetParentResourceName()}/paySingleBill`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({
          ref_id: bill.ref_id || bill.id
        })
      })
        .then(r => r.json())
        .then(data => {
          closeConfirmModal();
          if (data.success) {

            if (data.bankMoney !== undefined) {
              playerData.playerBankMoney = data.bankMoney;
              updatePlayerMoney(data.bankMoney);
            }


            if (data.transactions) {
              const normalizedTxs = normalizeTransactionsPayload(data.transactions);
              setActiveTransactions(normalizedTxs);
              if (currentPage === 'overview') {
                populateLastTransactions(normalizedTxs);
              }
            }


            if (data.bill) {

              bill.status = data.bill.status || 'paid';
              bill.paid_date = data.bill.paid_date;


              const billsToUpdate = currentAccountType === 'business' ? societyBills : playerBills;
              const billIndex = billsToUpdate.findIndex(b => (b.ref_id || b.id) === (bill.ref_id || bill.id));
              if (billIndex !== -1) {
                billsToUpdate[billIndex].status = data.bill.status || 'paid';
                billsToUpdate[billIndex].paid_date = data.bill.paid_date;
              }


              const billModal = document.getElementById('viewBillModal');
              if (billModal) {

                const statusEl = billModal.querySelector('.receipt-status');
                if (statusEl) {
                  statusEl.className = 'receipt-status active';
                  statusEl.textContent = _L('ui_paid') || 'Paid';
                }


                const payButton = billModal.querySelector('#paybill_btn');
                if (payButton) {
                  payButton.style.display = 'none';
                }


                const paidDateEl = billModal.querySelector('.bill-modal-paid');
                if (paidDateEl && data.bill.paid_date) {
                  const paidDate = formatBillDate(data.bill.paid_date);
                  paidDateEl.textContent = `${_L('ui_paid_on')} ${paidDate}`;
                  paidDateEl.style.display = 'flex';
                }
              }


              if (currentPage === 'bills') {
                loadAllBills();
              }
            }
          }
        });
    }
  );
}


$(document).on('click', '#paybill_btn', function () {
  const bill = this._billData;
  if (bill) {
    paySingleBill(bill);
  }
});


$(document).on('click', '#print_receipt_btn', function () {
  const refId = this._billRefId;
  if (refId) {
    var printText = `${_L('ui_are_you_sure_print_receipt')}<br>${_L('ui_price')}: <span class="bold">${formatCurrency(printReceiptPrice)}</span>`;
    if (printReceiptPrice == 0) {
      printText = `${_L('ui_are_you_sure_print_receipt')}`;
    }

    openConfirmModal(
      printText,
      _L('ui_print'),
      'blue',
      function () {
        printReceipt(refId);
      }
    );
  }
});


$(document).on('click', '#printreceipt_btn', function () {
  const txInfo = this._txInfo;
  if (txInfo) {
    var printText = `${_L('ui_are_you_sure_print_receipt')}<br>${_L('ui_price')}: <span class="bold">${formatCurrency(printReceiptPrice)}</span>`;
    if (printReceiptPrice == 0) {
      printText = `${_L('ui_are_you_sure_print_receipt')}`;
    }

    openConfirmModal(
      printText,
      _L('ui_print'),
      'blue',
      function () {
        printTransactionReceipt(txInfo);
      }
    );
  }
});


$(document).on('click', '#closeViewBillModal, #viewBillModal', function (e) {

  if (e.target.id === 'viewBillModal' || e.target.id === 'closeViewBillModal' || e.target.closest('#closeViewBillModal')) {
    const modal = document.getElementById('viewBillModal');
    if (modal) {
      modal.classList.remove('show');
      setTimeout(() => {
        modal.style.display = 'none';
      }, 300);
    }
  }
});


$(document).on('click', '#closeViewTransactionModal, #viewTransactionModal', function (e) {

  if (e.target.id === 'viewTransactionModal' || e.target.id === 'closeViewTransactionModal' || e.target.closest('#closeViewTransactionModal')) {
    const modal = document.getElementById('viewTransactionModal');
    if (modal) {
      modal.classList.remove('show');
      setTimeout(() => {
        modal.style.display = 'none';
      }, 300);
    }
  }
});

function updateCardAlertMessages(activationFee) {
  const blockingAlertMessage = document.querySelector('#manageCardModal .manage-card-alert-blocking .alert-message');
  const activatingAlertMessage = document.querySelector('#manageCardModal .manage-card-alert-activating .alert-message');

  if (blockingAlertMessage) {
    const blockingText = _L('ui_blocking_card_warning');
    const formattedFee = formatCurrency(activationFee);
    blockingAlertMessage.innerHTML = blockingText.replace('{fee}', formattedFee);
  }

  if (activatingAlertMessage) {
    const activatingText = _L('ui_activating_card_info');
    const formattedFee = formatCurrency(activationFee);
    activatingAlertMessage.innerHTML = activatingText.replace('{fee}', formattedFee);
  }
}


const currencyLocaleMap = {
  'EUR': 'de-DE',
  'USD': 'en-US',
  'GBP': 'en-GB',
  'JPY': 'ja-JP',
  'BRL': 'pt-BR',
  'CAD': 'en-CA',
  'AUD': 'en-AU',
  'CHF': 'de-CH',
  'CNY': 'zh-CN',
  'INR': 'en-IN',
  'KRW': 'ko-KR',
  'MXN': 'es-MX',
  'RUB': 'ru-RU',
  'SEK': 'sv-SE',
  'NOK': 'nb-NO',
  'DKK': 'da-DK',
  'PLN': 'pl-PL',
  'CZK': 'cs-CZ',
  'HUF': 'hu-HU',
  'TRY': 'tr-TR',
  'ZAR': 'en-ZA',
  'AED': 'ar-AE',
  'SAR': 'ar-SA',
  'THB': 'th-TH',
  'SGD': 'en-SG',
  'HKD': 'en-HK',
  'NZD': 'en-NZ',
};


const formatCurrency = (value) => {
  const num = Math.floor(toNumber(value));

  try {

    const locale = currencyLocaleMap[currentCurrency] || 'en-US';


    const formatter = new Intl.NumberFormat(locale, {
      style: 'currency',
      currency: currentCurrency,
      minimumFractionDigits: 0,
      maximumFractionDigits: 0
    });

    var formatted = formatter.format(num);


    formatted = formatted.replace(/(\$|€|£|¥|₹|₽|₩|₺|R\$|kr|zł|Kč|Ft|د\.إ|ر\.س|฿|CHF)\s+/g, '$1');
    formatted = formatted.replace(/\s+(€|₽|kr|zł|Kč|Ft|د\.إ|ر\.س)$/g, '$1');

    return formatted;
  } catch (error) {

    const fallbackFormatter = new Intl.NumberFormat('de-DE', {
      style: 'currency',
      currency: 'EUR',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0
    });

    var fallbackFormatted = fallbackFormatter.format(num);

    fallbackFormatted = fallbackFormatted.replace(/(\$|€|£|¥|₹|₽|₩|₺|R\$|kr|zł|Kč|Ft|د\.إ|ر\.س|฿|CHF)\s+/g, '$1');
    fallbackFormatted = fallbackFormatted.replace(/\s+(€|₽|kr|zł|Kč|Ft|د\.إ|ر\.س)$/g, '$1');

    return fallbackFormatted;
  }
};


const formatExpirationDate = (dateString) => {
  if (!dateString) return '';

  if (dateString.match(/^\d{2}\/\d{2}$/)) return dateString;

  if (dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
    return dateString.substring(0, 5);
  }
  return dateString;
};


function normalizeTransactionsPayload(payload) {
  if (Array.isArray(payload)) return payload;

  if (payload?.transactions && Array.isArray(payload.transactions)) return payload.transactions;
  if (payload?.data) {
    if (Array.isArray(payload.data)) return payload.data;
    if (Array.isArray(payload.data.transactions)) return payload.data.transactions;
  }

  if (payload && typeof payload === 'object') {
    const id = (playerData && (playerData.playerCitizenId || playerData.playerIBAN)) || null;
    if (id && Array.isArray(payload[id])) return payload[id];
    const firstArray = Object.values(payload).find(Array.isArray);
    if (firstArray) return firstArray;
  }

  return [];
}


function parseTxDate(s) {
  const m = String(s || '').match(/^(\d{4})\/(\d{2})\/(\d{2})\s*-\s*(\d{2}):(\d{2}):(\d{2})$/);
  if (!m) return null;
  const [, yyyy, mm, dd, HH, MM, SS] = m;
  return new Date(`${yyyy}-${mm}-${dd}T${HH}:${MM}`);
}


const toNumber = (v) => {
  if (typeof v === 'number') return v;
  return Number(String(v).replace(/[^\d.-]/g, '')) || 0;
};

const norm = (v) => String(v ?? '').trim().toLowerCase();
const selfKeys = () => {

  if (isATMMode && atmCardOwnerCitizenId && currentAccountType === 'personal') {
    return [norm(atmCardOwnerCitizenId), norm(playerData?.playerIBAN || ''), norm(playerData?.playerCardHolder || '')];
  }
  if (currentAccountType === 'card' && playerData?.playerCitizenId) {
    return [norm(playerData.playerCitizenId), norm(playerData?.playerIBAN || ''), norm(playerData?.playerCardHolder || '')];
  }


  if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const accountKey = currentAccountType;
    const account = accounts[accountKey];
    if (account && account.accountData) {
      const accountIdentifier = account.accountData.account_identifier || '';
      const accountHolder = account.accountData.account_holder || '';
      const accountIban = account.iban() || '';
      const accountName = account.name() || '';

      return [norm(accountIdentifier), norm(accountHolder), norm(accountIban), norm(accountName)];
    }
  }


  if (currentAccountType === 'personal' || !currentAccountType) {
    const keys = [];
    const e = getActiveEntity();
    keys.push(norm(e.citizenId), norm(e.iban), norm(e.name));


    if (Array.isArray(customAccountsData)) {
      customAccountsData.forEach(account => {
        if (account && account.account_identifier && account.account_holder === playerData?.playerCitizenId) {
          keys.push(norm(account.account_identifier));
        }
      });
    }

    return keys;
  }
  const e = getActiveEntity();
  return [norm(e.citizenId), norm(e.iban), norm(e.name)];
};

function formatUtcToDowTime(utcStr, locale) {
  if (!utcStr) return '—';

  var d;
  const m = String(utcStr).match(
    /^(\d{4})-(\d{2})-(\d{2})\s+(\d{2}):(\d{2})\s+UTC$/i
  );
  if (m) {
    const [, y, mo, day, h, min] = m.map(Number);
    d = new Date(Date.UTC(y, mo - 1, day, h, min));
  } else {

    d = new Date(utcStr);
    if (isNaN(d)) return '—';
  }

  const loc = locale || window.okokLangCode || undefined;
  const dow = d.toLocaleDateString(loc, { weekday: 'short' });
  const hm = d.toLocaleTimeString(loc, {
    hour: '2-digit',
    minute: '2-digit',
    hour12: false
  });
  return `${dow} ${hm}`;
}


function txSignForSelf(tx) {
  const me = selfKeys();


  const senderIdMatch = me.includes(norm(tx.sender_identifier));
  const receiverIdMatch = me.includes(norm(tx.receiver_identifier));


  let primaryIdentifier = null;
  if (currentAccountType === 'personal' || !currentAccountType) {
    primaryIdentifier = norm(playerData?.playerCitizenId || '');
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const accountKey = currentAccountType;
    const account = accounts[accountKey];
    if (account && account.accountData) {
      primaryIdentifier = norm(account.accountData.account_identifier || '');
    }
  } else if (currentAccountType === 'business' && societyData) {
    primaryIdentifier = norm(societyData.society || '');
  }


  const senderNameMatch = !senderIdMatch && !receiverIdMatch && me.includes(norm(tx.sender_name));
  const receiverNameMatch = !senderIdMatch && !receiverIdMatch && me.includes(norm(tx.receiver_name));

  const senderIsMe = senderIdMatch || senderNameMatch;
  const receiverIsMe = receiverIdMatch || receiverNameMatch;

  // Handle savings transfers with specific types
  if (tx.type === 'transfer_to_savings') {
    // Transfer TO savings FROM main account
    if (currentAccountType === 'savings') {
      return +1; // Money coming IN to savings
    } else {
      return -1; // Money going OUT from main account
    }
  }
  
  if (tx.type === 'transfer_from_savings') {
    // Transfer FROM savings TO main/other account
    if (currentAccountType === 'savings') {
      return -1; // Money going OUT from savings
    } else {
      return +1; // Money coming IN to main account
    }
  }
  
  // Fallback for old 'transfer_savings' transactions (backwards compatibility)
  if (tx.type === 'transfer_savings') {
    if (currentAccountType === 'savings') {
      if (senderIsMe && !receiverIsMe) return -1;
      if (receiverIsMe && !senderIsMe) return +1;
      if (senderIdMatch && receiverIdMatch) return +1;
    } else {
      if (receiverIsMe && !senderIsMe) return +1;
      if (senderIsMe && !receiverIsMe) return -1;
      if (senderIdMatch && receiverIdMatch) return -1;
    }
  }

  if (senderIdMatch && receiverIdMatch && primaryIdentifier) {
    if (norm(tx.sender_identifier) === primaryIdentifier) {
      return -1;
    } else if (norm(tx.receiver_identifier) === primaryIdentifier) {
      return +1;
    }
  }

  if (senderIsMe && !receiverIsMe) return -1;

  function updateWalletMoney(walletMoney) {
    if (typeof walletMoney === 'number') playerData.playerWalletMoney = walletMoney;
    $('.wallet').text(formatCurrency(playerData.playerWalletMoney || 0));
  }

  if (receiverIsMe && !senderIsMe) return +1;
  if (senderIsMe && receiverIsMe) return 0;


  if (tx.type === 'deposit') return +1;
  if (tx.type === 'withdraw') return -1;
  return 0;
}

function isOutgoing(tx) { return txSignForSelf(tx) < 0; }

function registerOrUpdateAccounts() {

  accounts.personal = {
    key: 'personal',
    name: () => playerData?.playerName || '',
    iban: () => playerData?.playerIBAN || 'N/A',
    citizenId: () => playerData?.playerCitizenId || '',
    bankMoney: () => toNumber(playerData?.playerBankMoney),
    walletMoney: () => toNumber(playerData?.playerWalletMoney),
    transactions: () => playerTransactions,
    preload: preloadTransactions,
  };


  accounts.savings = {
    key: 'savings',
    name: () => (openedAccount === 'business') ? (societyData?.society_name || '') : (playerData?.playerName || ''),
    iban: () => (openedAccount === 'business') ? (societyData?.iban || 'N/A') : (playerData?.playerIBAN || 'N/A'),
    citizenId: () => (openedAccount === 'business') ? (societyData?.society || '') : (playerData?.playerCitizenId || ''),
    bankMoney: () => {
      if (openedAccount === 'business') {
        return toNumber(societyData?.savings?.balance || 0);
      } else {
        return toNumber(playerData?.savings?.balance || 0);
      }
    },
    walletMoney: () => toNumber(playerData?.playerWalletMoney),
    transactions: () => (openedAccount === 'business') ? (societyTransactions || []) : playerTransactions,
    preload: (openedAccount === 'business') ? preloadSocietyTransactions : preloadTransactions,
  };


  if (societyData && Object.keys(societyData).length) {
    accounts.business = {
      key: 'business',
      name: () => societyData?.society_name || '',
      iban: () => societyData?.iban || '',
      citizenId: () => societyData?.society || '',
      bankMoney: () => toNumber(societyData?.value),
      walletMoney: () => toNumber(playerData?.playerWalletMoney),
      transactions: () => societyTransactions || [],
      preload: preloadSocietyTransactions,
    };
  } else {
    delete accounts.business;
  }


  if (Array.isArray(customAccountsData)) {
    customAccountsData.forEach(account => {
      if (account && account.account_identifier) {
        const accountKey = `custom_${account.account_identifier}`;

        const accountData = {
          account_identifier: account.account_identifier,
          account_holder: account.account_holder,
          owner_name: account.owner_name,
          account_name: account.account_name || account.owner_name,
          balance: toNumber(account.balance || 0),
          iban: account.iban || 'N/A',
          pincode: account.pincode,
          account_type: account.account_type || 'custom',
          is_owner: account.is_owner,
          permissions: account.permissions,
          transactions: account.transactions || []
        };

        accounts[accountKey] = {
          key: accountKey,
          name: () => accountData.account_name || accountData.owner_name || '',
          iban: () => accountData.iban || 'N/A',
          citizenId: () => accountData.account_holder || '',
          bankMoney: () => accountData.balance,
          walletMoney: () => toNumber(playerData?.playerWalletMoney || 0),
          transactions: function () {

            if (this.accountData && this.accountData.transactions) {
              return this.accountData.transactions;
            }
            return [];
          },
          preload: async () => { return []; },
          accountData: accountData
        };


        if (account.pincode) {
          try {
            if (typeof account.pincode === 'string') {
              customAccountCardsData[account.account_identifier] = JSON.parse(account.pincode);
            } else {
              customAccountCardsData[account.account_identifier] = account.pincode;
            }
          } catch (e) {
            customAccountCardsData[account.account_identifier] = [];
          }
        } else {
          customAccountCardsData[account.account_identifier] = [];
        }
      }
    });
  }
}

function getAccount(key) {
  return accounts[key] || accounts.personal;
}

function setActiveAccount(key) {
  const oldAccountType = currentAccountType;
  const oldOpenedAccount = openedAccount;

  if (currentAccountType !== 'savings') {
    currentAccountType = (key && accounts[key]) ? key : 'personal';
  }

  if (currentAccountType === 'savings') {
    if (key === 'personal') {
      openedAccount = 'personal';
    } else if (key === 'business') {
      openedAccount = 'business';
    } else if (key && key.startsWith('custom_')) {
      openedAccount = key;
    }
  } else if (key === 'personal') {
    openedAccount = 'personal';
  } else if (key === 'business') {
    openedAccount = 'business';
  } else if (key && key.startsWith('custom_')) {
    openedAccount = key;
  } else if (key === 'savings') {
    if (oldAccountType === 'business') {
      openedAccount = 'business';
    } else if (oldAccountType && oldAccountType.startsWith('custom_')) {
      openedAccount = oldAccountType;
    } else {
      openedAccount = 'personal';
    }
  }

  previousAccountType = (key && accounts[key]) ? key : 'personal';

  applyCurrentAccountToUI();

  if (currentPage === 'savings' && currentAccountType === 'savings') {
    renderSavingsInfo();
  }
}

function getActiveEntity() {
  const acc = getAccount(currentAccountType);
  return {
    name: acc.name() || '',
    iban: acc.iban(),
    citizenId: acc.citizenId(),
    bankMoney: acc.bankMoney(),
    walletMoney: toNumber(playerData?.playerWalletMoney),
  };
}

function getActiveTransactions() {
  return getAccount(currentAccountType).transactions() || [];
}

async function preloadSocietyTransactions() {

  try {
    const res = await fetch(`https://${GetParentResourceName()}/getSocietyTransactions`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ key: societyData?.society })
    });
    if (res.ok) {
      const payload = await res.json();
      societyTransactions = normalizeTransactionsPayload(payload);
    }
  } catch (_) { }
  return societyTransactions || [];
}

async function preloadActiveTransactions() {
  const key = currentAccountType;
  const acc = getAccount(key);

  const cached = getActiveTransactions();
  if (Array.isArray(cached) && cached.length) return cached;


  if (__preloadPromises[key]) return __preloadPromises[key];

  if (typeof acc.preload === 'function') {
    __preloadPromises[key] = acc.preload().finally(() => { __preloadPromises[key] = null; });
    return __preloadPromises[key];
  }
  return cached || [];
}

function updateAvatar() {
  const avatarImg = document.querySelector('.avatar');
  if (avatarImg && playerData && playerData.sex !== undefined) {
    const avatarPath = playerData.sex === 0 ? 'img/avatar_male.png' : 'img/avatar_female.png';
    avatarImg.src = avatarPath;
  }
}

function applyCurrentAccountToUI() {
  const e = getActiveEntity();

  $('.iban').text(e.iban || 'N/A');
  if (document.querySelector('.balance-value')) $('.balance-value').text(formatCurrency(e.bankMoney));
  if (e.bankMoney < 0) {
    $('.balance-value').css('color', '#ff4b4b')
  } else {
    $('.balance-value').css('color', '#fff')
  }
  if (document.querySelector('.wallet')) $('.wallet').text(formatCurrency(playerData?.playerWalletMoney || 0));

  const txs = getActiveTransactions();


  if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const accountKey = currentAccountType;
    const account = accounts[accountKey];
    if (account && account.accountData && account.accountData.transactions) {
      const accountTxs = normalizeTransactionsPayload(account.accountData.transactions);
      setActiveTransactions(accountTxs);
    }
  }


  if (currentPage === 'transactions') {
    loadAllTransactions(getActiveTransactions());
  } else if (currentPage === 'bills') {

    updatePayAllButtonVisibility();
    loadAllBills(getActiveBills());
  } else if (currentPage === 'savings') {
    renderSavingsInfo();

    let transactionsToUse = [];
    if (openedAccount === 'business') {
      transactionsToUse = societyTransactions || [];
    } else if (openedAccount && openedAccount.startsWith('custom_')) {

      const accountIdentifier = openedAccount.replace('custom_', '');
      const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
      if (customAccount && customAccount.savings && customAccount.transactions) {
        transactionsToUse = customAccount.transactions || [];
      } else {
        transactionsToUse = [];
      }
    } else {
      transactionsToUse = playerTransactions || [];
    }

    populateLastSavingsTransactions(transactionsToUse);


    const currentAccountId = getCurrentAccountId();
    const isAccountSwitch = lastRenderedSavingsAccount !== null && lastRenderedSavingsAccount !== currentAccountId;


    const svg = document.getElementById('savingsChart');
    const lineEl = svg ? document.getElementById('savingsLinePath') : null;
    const chartNotRendered = !lineEl || !lineEl.getAttribute('d') || lineEl.getAttribute('d') === '';

    if (chartNotRendered || isAccountSwitch) {

      lastRenderedSavingsAccount = currentAccountId;

      populateBalanceChartFromSavingsTransactions(transactionsToUse);
    }

    fetchAndRenderSavingsGoals();
  } else if (currentPage === 'loans') {

    renderCreditScoreChart();
    renderLoanPlans();
    fetchAndRenderActiveLoans();
  } else if (currentPage === 'overview') {


    if (!isInitialBankOpen && !isChangingAccount) {

      setCardsInfo();
    }
    populateLastTransactions(txs);
    populateBalanceChartFromTransactions(txs);
    if (playerData.playerPIN) $('.pin-value').text('●●●●');
  } else {
    populateLastTransactions(txs);
    populateBalanceChartFromTransactions(txs);
    if (playerData.playerPIN) $('.pin-value').text('●●●●');
  }
}

function applyCardsInfo() {
  $('.cards-list').empty();
  cardsConfig.cards.forEach(card => {
    $('.cards-list').append(`
      <div class="custom-select-option cso2" onclick="selectCustomOption(this, '${card.label}')">
        <span>${card.label} (${formatCurrency(card.price)})</span>
        <i class="fa-solid fa-check option-check"></i>
      </div>
    `);
  });
}

$(document).on('click', '#createnewcard_btn', function () {
  const m = document.getElementById('createNewCardModal');
  m.classList.remove('show');
  setTimeout(() => {
    m.style.display = 'none';
  }, 300);

  fetch(`https://${GetParentResourceName()}/createNewCard`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({
      from: currentAccountType,
      accountType: currentAccountType,
      cardType: selectedCardType,
      pin: $('#createnewcard_pin').val()
    })

  })
    .then(r => r.json())
    .then(data => {
      if (!data.success) return;


      let normalizedTxs = [];
      if (data.transactions && Array.isArray(data.transactions)) {
        normalizedTxs = normalizeTransactionsPayload(data.transactions);
        setActiveTransactions(normalizedTxs);


        if (currentAccountType === 'business' && societyData) {
          societyTransactions = normalizedTxs;
        } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
          const accountKey = currentAccountType;
          const accountIdentifier = currentAccountType.replace('custom_', '');
          if (accounts[accountKey] && accounts[accountKey].accountData) {
            accounts[accountKey].accountData.transactions = normalizedTxs;
          }

          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            customAccount.transactions = normalizedTxs;
          }
        } else {

          playerTransactions = normalizedTxs;
        }
      }


      if (currentAccountType === 'personal') {
        playerData.playerPIN = data.createdCard;
      } else if (currentAccountType === 'business') {

        businessCardsData = null;
        loadBusinessCards();


        if (data.bankBalance !== undefined && societyData) {
          societyData.value = data.bankBalance;
          updatePlayerMoney(data.bankBalance);
        }


        if (normalizedTxs.length > 0) {
          if (currentPage === 'overview') {
            populateLastTransactions(normalizedTxs);
            populateBalanceChartFromTransactions(normalizedTxs);
          } else if (currentPage === 'transactions') {
            loadAllTransactions(normalizedTxs);
          }
        }

        return;
      } else if (currentAccountType && currentAccountType.startsWith('custom_')) {

        const accountIdentifier = currentAccountType.replace('custom_', '');
        try {

          const updatedCards = typeof data.createdCard === 'string'
            ? JSON.parse(data.createdCard)
            : data.createdCard;


          customAccountCardsData[accountIdentifier] = updatedCards;
        } catch (e) {
          console.error('[createNewCard] Error parsing custom account cards:', e);
        }
      }

      setCardsInfo();


      if (data.bankBalance !== undefined) {
        if (currentAccountType === 'business' && societyData) {
          societyData.value = data.bankBalance;
        } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
          const accountIdentifier = currentAccountType.replace('custom_', '');
          const accountKey = currentAccountType;
          if (accounts[accountKey]) {
            accounts[accountKey].accountData.balance = data.bankBalance;
          }

          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            customAccount.balance = data.bankBalance;
          }
        } else {
          playerData.playerBankMoney = data.bankBalance;
        }
        updatePlayerMoney(data.bankBalance);
      }


      if (normalizedTxs.length > 0) {
        if (currentPage === 'overview') {
          populateLastTransactions(normalizedTxs);
          populateBalanceChartFromTransactions(normalizedTxs);
        } else if (currentPage === 'transactions') {
          loadAllTransactions(normalizedTxs);
        }
      }
    });
});

function applyAccountPatches(patches) {
  if (Array.isArray(patches)) {
    patches.forEach(p => {
      if (p.key && p.key === playerData.playerCitizenId) {
        playerData.playerBankMoney = toNumber(p.balance);
      }

      if (societyData && p.key && p.key === societyData.society) {
        societyData.value = toNumber(p.balance);
      }


    });
  }


  if (!isATMMode) {
    applyCurrentAccountToUI();
  } else {

    const e = getActiveEntity();
    if (document.querySelector('.balance-value')) {
      $('.balance-value').text(formatCurrency(e.bankMoney));
      if (e.bankMoney < 0) $('.balance-value').addClass('ci-blocked');
      else $('.balance-value').removeClass('ci-blocked');
    }
    if (document.querySelector('.wallet')) {
      $('.wallet').text(formatCurrency(playerData?.playerWalletMoney || 0));
    }
  }
}

function setActiveTransactions(txs) {
  const normalizedTxs = Array.isArray(txs) ? txs : [];

  if (currentAccountType === 'business') {
    societyTransactions = normalizedTxs;
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {

    const accountKey = currentAccountType;
    if (accounts[accountKey] && accounts[accountKey].accountData) {

      accounts[accountKey].accountData.transactions = normalizedTxs;

      const accountIdentifier = currentAccountType.replace('custom_', '');
      const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === accountIdentifier);
      if (accountIndex !== -1) {
        customAccountsData[accountIndex].transactions = normalizedTxs;
      }
    }
  } else if (currentAccountType === 'savings') {

    if (openedAccount === 'business') {
      societyTransactions = normalizedTxs;
    } else if (openedAccount && openedAccount.startsWith('custom_')) {

      const accountIdentifier = openedAccount.replace('custom_', '');
      const accountKey = openedAccount;
      if (accounts[accountKey] && accounts[accountKey].accountData) {
        accounts[accountKey].accountData.transactions = normalizedTxs;
      }
      const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === accountIdentifier);
      if (accountIndex !== -1) {
        customAccountsData[accountIndex].transactions = normalizedTxs;
      }
    } else {

      playerTransactions = normalizedTxs;
    }
  } else {

    playerTransactions = normalizedTxs;
  }
}


const dayMs = 24 * 60 * 60 * 1000;
function startOfDay(d) { const x = new Date(d); x.setHours(0, 0, 0, 0); return x; }
function pad2(n) { return String(n).padStart(2, '0'); }
function ymdLocal(d) { return `${d.getFullYear()}-${pad2(d.getMonth() + 1)}-${pad2(d.getDate())}`; }


function getChartAnimationKey(accountId, pageId) {


  return `${accountId}_${pageId}`;
}

function shouldAnimateChart(accountId, pageId) {

  const key = getChartAnimationKey(accountId, pageId);
  const hasPlayed = playedChartAnimations[key] === true;

  if (!hasPlayed) {


    setTimeout(() => {
      playedChartAnimations[key] = true;
    }, 500);
    return true;
  }

  return false;
}

function getCurrentAccountId() {


  if (currentPage === 'savings') {
    return openedAccount || 'personal';
  }
  return currentAccountType || 'personal';
}


function populateBalanceChartFromTransactions(rawTxs) {
  const chart = document.querySelector('.chart');
  const svg = document.getElementById('balanceChart');
  if (!chart || !svg) return;


  var noInfo = chart.querySelector('.chart-noinfo');
  if (!noInfo) {
    noInfo = document.createElement('div');
    noInfo.className = 'chart-noinfo';
    noInfo.innerHTML = `
      <div class="chart-text-group">
        <div class="cni-ft">${_L('ui_no_transaction_history')}</div>
        <div class="cni-lt">${_L('ui_make_first_transaction')}</div>
      </div>
      <div class="chart-divider"></div>`;
    chart.appendChild(noInfo);
  }


  const lineEl = document.getElementById('linePath');
  const areaEl = document.getElementById('areaPath');
  const ptsGroup = document.getElementById('pointsGroup');
  const lblContainer = document.getElementById('chartLabels');
  if (lineEl) lineEl.setAttribute('d', '');
  if (areaEl) areaEl.setAttribute('d', '');
  if (ptsGroup) ptsGroup.innerHTML = '';
  if (lblContainer) lblContainer.innerHTML = '';

  const txs = normalizeTransactionsPayload(rawTxs);
  const filteredTxs = Array.isArray(txs) ? txs.filter(tx => {
    const txType = typeof tx.type === 'string' ? tx.type : '';
    return txType !== 'deposit_savings' && txType !== 'withdraw_savings';
  }) : [];
  const series = buildLast7DaysSeries(filteredTxs);

  if (series.count === 0) {
    svg.style.display = 'none';
    noInfo.style.display = 'flex';
    return;
  }

  noInfo.style.display = 'none';
  svg.style.display = 'flex';


  const accountId = getCurrentAccountId();
  const shouldAnimate = shouldAnimateChart(accountId, 'overview');


  if (isInitialBankOpen && shouldAnimate) {
    const container = document.querySelector('.container');
    const isContainerVisible = container && (container.style.display === 'flex' || window.getComputedStyle(container).display === 'flex');

    if (!isContainerVisible) {

      pendingChartAnimation = {
        labels: series.labels,
        data: series.data,
        type: 'overview',
        shouldAnimate: true
      };

      renderBalanceChart(series.labels, series.data, false);
      return;
    }
  }

  renderBalanceChart(series.labels, series.data, shouldAnimate);
}


function buildLast7DaysSeries(txs) {
  const today0 = startOfDay(new Date());
  const start0 = new Date(today0.getTime() - 6 * dayMs);
  const end0 = new Date(today0.getTime() + dayMs);


  const labels = [];
  const keys = [];
  for (var i = 0; i < 7; i++) {
    const d = new Date(start0.getTime() + i * dayMs);
    labels.push(d.toLocaleDateString('en-GB', { weekday: 'short' }));
    keys.push(ymdLocal(d));
  }

  const byDay = Object.create(null);
  var usedCount = 0;

  for (const tx of (Array.isArray(txs) ? txs : [])) {
    const dt = parseTxDate(tx.date);
    if (!dt) continue;
    if (dt < start0 || dt >= end0) continue;

    const sign = txSignForSelf(tx);
    if (sign === 0) continue;

    const key = ymdLocal(startOfDay(dt));
    byDay[key] = (byDay[key] || 0) + sign * toNumber(tx.value);
    usedCount++;
  }

  const data = keys.map(k => byDay[k] || 0);
  return { labels, data, count: usedCount };
}

function buildLast7DaysSavingsSeries(txs, currentBalance) {
  const today0 = startOfDay(new Date());
  const start0 = new Date(today0.getTime() - 6 * dayMs);
  const end0 = new Date(today0.getTime() + dayMs);

  const labels = [];
  const keys = [];
  for (var i = 0; i < 7; i++) {
    const d = new Date(start0.getTime() + i * dayMs);
    labels.push(d.toLocaleDateString('en-GB', { weekday: 'short' }));
    keys.push(ymdLocal(d));
  }

  const validTxs = [];
  for (const tx of (Array.isArray(txs) ? txs : [])) {
    const dt = parseTxDate(tx.date);
    if (!dt) continue;
    if (dt < start0 || dt >= end0) continue;

    const sign = txSignForSelf(tx);
    if (sign === 0) continue;

    validTxs.push({
      date: dt,
      dateKey: ymdLocal(startOfDay(dt)),
      value: sign * toNumber(tx.value)
    });
  }

  validTxs.sort((a, b) => a.date - b.date);

  const byDay = Object.create(null);
  for (const tx of validTxs) {
    byDay[tx.dateKey] = (byDay[tx.dateKey] || 0) + tx.value;
  }

  let startingBalance = currentBalance || 0;
  for (const tx of validTxs) {
    startingBalance -= tx.value;
  }

  const data = [];
  let runningBalance = startingBalance;
  
  for (const key of keys) {
    if (byDay[key]) {
      runningBalance += byDay[key];
      data.push(runningBalance);
    } else {
      data.push(0);
    }
  }

  return { labels, data, count: validTxs.length };
}


function createSmoothPathFromPoints(points) {
  if (points.length < 2) return '';
  if (points.length === 2) return `M ${points[0].x} ${points[0].y} L ${points[1].x} ${points[1].y}`;

  var path = `M ${points[0].x} ${points[0].y}`;
  const tension = 0.4;

  for (var i = 0; i < points.length - 1; i++) {
    const current = points[i];
    const next = points[i + 1];
    const prev = i > 0 ? points[i - 1] : points[i];
    const nextNext = i < points.length - 2 ? points[i + 2] : points[i + 1];

    const yDiff = Math.abs(next.y - current.y);
    const threshold = 3;

    if (yDiff < threshold) {
      path += ` L ${next.x} ${next.y}`;
      continue;
    }

    const d01 = Math.sqrt(Math.pow(current.x - prev.x, 2) + Math.pow(current.y - prev.y, 2));
    const d12 = Math.sqrt(Math.pow(next.x - current.x, 2) + Math.pow(next.y - current.y, 2));
    const d23 = Math.sqrt(Math.pow(nextNext.x - next.x, 2) + Math.pow(nextNext.y - next.y, 2));

    var fa = tension * d12 / (d01 + d12 || 1);
    var fb = tension * d12 / (d12 + d23 || 1);

    const cp1x = current.x + fa * (next.x - prev.x);
    const cp1y = current.y + fa * (next.y - prev.y);
    const cp2x = next.x - fb * (nextNext.x - current.x);
    const cp2y = next.y - fb * (nextNext.y - current.y);

    path += ` C ${cp1x} ${cp1y}, ${cp2x} ${cp2y}, ${next.x} ${next.y}`;
  }

  return path;
}


let sharedAnimationStartTime = null;
const sharedEasing = (t) => t * (2 - t);


function animatePathTransition(pathElement, oldPoints, newPoints, isAreaPath, chartHeight, duration = 600) {
  if (!pathElement || !oldPoints || !newPoints || oldPoints.length !== newPoints.length) {
    return;
  }


  sharedAnimationStartTime = performance.now();
  const startTime = sharedAnimationStartTime;
  const easing = sharedEasing;

  function animate(currentTime) {
    const elapsed = currentTime - startTime;
    const progress = Math.min(elapsed / duration, 1);
    const easedProgress = easing(progress);


    const interpolatedPoints = oldPoints.map((oldPoint, index) => {
      const newPoint = newPoints[index];
      return {
        x: oldPoint.x + (newPoint.x - oldPoint.x) * easedProgress,
        y: oldPoint.y + (newPoint.y - oldPoint.y) * easedProgress
      };
    });


    let interpolatedPath = createSmoothPathFromPoints(interpolatedPoints);
    if (isAreaPath) {
      const bottomRight = interpolatedPoints[interpolatedPoints.length - 1];
      const bottomLeft = interpolatedPoints[0];
      interpolatedPath += ` L ${bottomRight.x} ${chartHeight} L ${bottomLeft.x} ${chartHeight} Z`;
    }

    pathElement.setAttribute('d', interpolatedPath);

    if (progress < 1) {
      requestAnimationFrame(animate);
    } else {

      sharedAnimationStartTime = null;
    }
  }

  requestAnimationFrame(animate);
}


function animateCircleTransition(circleElement, oldX, oldY, newX, newY, duration = 600) {
  if (!circleElement) return;


  const startTime = sharedAnimationStartTime || performance.now();
  if (!sharedAnimationStartTime) {
    sharedAnimationStartTime = startTime;
  }
  const easing = sharedEasing;

  function animate(currentTime) {
    const elapsed = currentTime - startTime;
    const progress = Math.min(elapsed / duration, 1);
    const easedProgress = easing(progress);


    const x = oldX + (newX - oldX) * easedProgress;
    const y = oldY + (newY - oldY) * easedProgress;

    circleElement.setAttribute('cx', x);
    circleElement.setAttribute('cy', y);

    if (progress < 1) {
      requestAnimationFrame(animate);
    }
  }

  requestAnimationFrame(animate);
}


function renderBalanceChart(labels, data, shouldAnimate = true) {
  const width = 400, height = 150, padding = 20, chartHeight = 110;


  const isUpdateAnimation = !shouldAnimate && previousChartPoints && previousChartPoints.length === data.length;


  const minValue = Math.min(...data);
  const maxValue = Math.max(...data);
  const valueRange = maxValue - minValue;

  const minHeight = (chartHeight - 2 * padding) * 0.2;
  const amplificationFactor = 1.5;


  function getPathLength(pathElement) {
    if (!pathElement) return 0;
    try {
      return pathElement.getTotalLength();
    } catch (e) {
      return 0;
    }
  }

  function getCoords(index, value) {
    const x = padding + (index * (width - 2 * padding)) / (data.length - 1);


    let normalizedHeight;
    if (valueRange < 0.01) {

      if (Math.abs(value) < 0.01) {

        normalizedHeight = 0;
      } else {

        normalizedHeight = 0.3;
      }
    } else {

      normalizedHeight = (value - minValue) / valueRange;

      normalizedHeight = Math.pow(normalizedHeight, 1 / amplificationFactor);
    }

    var proportionalHeight = normalizedHeight * (chartHeight - 2 * padding);


    if (valueRange >= 0.01) {
      proportionalHeight = Math.max(proportionalHeight, minHeight);
    }


    const zeroLineOffset = 14;
    const y = chartHeight - zeroLineOffset - proportionalHeight;
    return { x, y };
  }

  function createSmoothPath(points) {
    if (points.length < 2) return '';
    if (points.length === 2) return `M ${points[0].x} ${points[0].y} L ${points[1].x} ${points[1].y}`;

    var path = `M ${points[0].x} ${points[0].y}`;

    for (var i = 0; i < points.length - 1; i++) {
      const current = points[i];
      const next = points[i + 1];
      const prev = i > 0 ? points[i - 1] : points[i];
      const nextNext = i < points.length - 2 ? points[i + 2] : points[i + 1];


      const currentValue = data[i];
      const nextValue = data[i + 1];
      const prevValue = i > 0 ? data[i - 1] : currentValue;
      const nextNextValue = i < data.length - 2 ? data[i + 2] : nextValue;

      const tension = 0.4;

      const d01 = Math.sqrt(Math.pow(current.x - prev.x, 2) + Math.pow(current.y - prev.y, 2));
      const d12 = Math.sqrt(Math.pow(next.x - current.x, 2) + Math.pow(next.y - current.y, 2));
      const d23 = Math.sqrt(Math.pow(nextNext.x - next.x, 2) + Math.pow(nextNext.y - next.y, 2));

      var fa = tension * d12 / (d01 + d12 || 1);
      var fb = tension * d12 / (d12 + d23 || 1);


      const yDiff = Math.abs(next.y - current.y);
      const threshold = 3;


      if (currentValue === nextValue || yDiff < threshold) {

        path += ` L ${next.x} ${next.y}`;
        continue;
      } else if (prevValue === currentValue && nextValue !== currentValue) {

        fa = 0.2;
      } else if (currentValue !== nextValue && nextValue === nextNextValue) {

        fb = 0.2;
      }


      const cp1x = current.x + fa * (next.x - prev.x);
      const cp1y = current.y + fa * (next.y - prev.y);
      const cp2x = next.x - fb * (nextNext.x - current.x);
      const cp2y = next.y - fb * (nextNext.y - current.y);

      path += ` C ${cp1x} ${cp1y}, ${cp2x} ${cp2y}, ${next.x} ${next.y}`;
    }

    return path;
  }

  var points = [];
  data.forEach((value, index) => {
    const coords = getCoords(index, value);
    points.push(coords);
  });


  const lineEl = document.getElementById('linePath');
  const areaEl = document.getElementById('areaPath');

  const smoothLinePath = createSmoothPath(points);
  const bottomRightPoint = points[points.length - 1];
  const bottomLeftPoint = points[0];
  const smoothAreaPath = createSmoothPath(points) + ` L ${bottomRightPoint.x} ${chartHeight} L ${bottomLeftPoint.x} ${chartHeight} Z`;


  if (lineEl) {
    if (isUpdateAnimation && previousChartPoints) {

      animatePathTransition(lineEl, previousChartPoints, points, false, chartHeight, 600);
    } else {
      lineEl.setAttribute('d', smoothLinePath);
      if (shouldAnimate) {

        lineEl.style.strokeDasharray = 'none';
        lineEl.style.strokeDashoffset = '0';
        lineEl.style.opacity = '0';
      } else {

        lineEl.style.opacity = '1';
        lineEl.style.strokeDasharray = 'none';
        lineEl.style.strokeDashoffset = '0';
      }
    }
  }

  if (areaEl) {
    if (isUpdateAnimation && previousChartPoints) {

      animatePathTransition(areaEl, previousChartPoints, points, true, chartHeight, 600);
    } else {
      areaEl.setAttribute('d', smoothAreaPath);
      if (shouldAnimate) {

        areaEl.style.opacity = '0';
      } else {

        areaEl.style.opacity = '1';
      }
    }
  }


  if (shouldAnimate && lineEl) {

    requestAnimationFrame(() => {
      requestAnimationFrame(() => {

        void lineEl.offsetWidth;

        const pathLength = getPathLength(lineEl);
        if (pathLength > 0) {

          lineEl.style.strokeDasharray = pathLength + ' ' + pathLength;
          lineEl.style.strokeDashoffset = pathLength;
          lineEl.style.transition = 'none';
          lineEl.style.opacity = '1';


          requestAnimationFrame(() => {
            lineEl.style.transition = 'stroke-dashoffset 1s ease-out, opacity 0.3s ease-out';
            lineEl.style.strokeDashoffset = '0';
          });
        } else {

          lineEl.style.opacity = '0';
          requestAnimationFrame(() => {
            lineEl.style.transition = 'opacity 0.5s ease-out';
            lineEl.style.opacity = '1';
          });
        }
      });
    });
  }


  if (shouldAnimate && areaEl) {
    setTimeout(() => {
      areaEl.style.transition = 'opacity 0.6s ease-out';
      areaEl.style.opacity = '1';
    }, 300);
  }

  const pointsGroup = document.getElementById('pointsGroup');
  const labelContainer = document.getElementById('chartLabels');


  let oldPoints = null;
  if (isUpdateAnimation) {
    oldPoints = previousChartPoints;
  }


  pointsGroup.innerHTML = '';
  if (labelContainer) labelContainer.innerHTML = '';

  data.forEach((value, index) => {
    const coords = getCoords(index, value);
    const circle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');

    if (isUpdateAnimation && oldPoints && oldPoints[index]) {

      circle.setAttribute('cx', oldPoints[index].x);
      circle.setAttribute('cy', oldPoints[index].y);
      circle.setAttribute('r', '4');
      circle.style.opacity = '1';

      animateCircleTransition(circle, oldPoints[index].x, oldPoints[index].y, coords.x, coords.y, 600);
    } else {
      circle.setAttribute('cx', coords.x);
      circle.setAttribute('cy', coords.y);
      if (shouldAnimate) {
        circle.setAttribute('r', '0');
        circle.style.opacity = '0';
        circle.style.transition = 'r 0.3s ease-out, opacity 0.3s ease-out';
      } else {
        circle.setAttribute('r', '4');
        circle.style.opacity = '1';
        circle.style.transition = '.1s';
      }
    }
    circle.setAttribute('fill', '#1f5eff');
    circle.setAttribute('stroke', '#272727');
    circle.setAttribute('stroke-width', '2');
    circle.style.cursor = 'pointer';

    circle.addEventListener('mouseenter', function (e) {
      this.setAttribute('r', '6');
      this.setAttribute('fill', '#1f5eff');
      this.setAttribute('stroke', '#272727');


      showCustomTooltip(this, `${labels[index]}: ${formatCurrency(value)}`);
    });

    circle.addEventListener('mouseleave', function () {
      this.setAttribute('r', '4');
      this.setAttribute('fill', '#1f5eff');
      this.setAttribute('stroke', '#272727');
      hideCustomTooltip();
    });

    pointsGroup.appendChild(circle);


    if (shouldAnimate) {
      setTimeout(() => {
        circle.setAttribute('r', '4');
        circle.style.opacity = '1';
      }, 600 + (index * 50));
    }

    if (labelContainer) {
      const label = document.createElement('div');
      label.className = 'chart-label';
      label.textContent = labels[index];
      if (shouldAnimate) {
        label.style.opacity = '0';
        label.style.transition = 'opacity 0.3s ease-out';
        labelContainer.appendChild(label);


        setTimeout(() => {
          label.style.opacity = '1';
        }, 800 + (index * 30));
      } else {
        labelContainer.appendChild(label);
      }
    }
  });


  previousChartPoints = points.map(p => ({ x: p.x, y: p.y }));
}

function renderSavingsBalanceChart(labels, data, shouldAnimate = true) {
  const width = 400, height = 150, padding = 20, chartHeight = 110;


  const isUpdateAnimation = !shouldAnimate && previousSavingsChartPoints && previousSavingsChartPoints.length === data.length;


  const minValue = Math.min(...data);
  const maxValue = Math.max(...data);
  const valueRange = maxValue - minValue;

  const minHeight = (chartHeight - 2 * padding) * 0.2;
  const amplificationFactor = 1.5;


  function getPathLength(pathElement) {
    if (!pathElement) return 0;
    try {
      return pathElement.getTotalLength();
    } catch (e) {
      return 0;
    }
  }

  function getCoords(index, value) {
    const x = padding + (index * (width - 2 * padding)) / (data.length - 1);


    let normalizedHeight;
    if (valueRange < 0.01) {

      if (Math.abs(value) < 0.01) {

        normalizedHeight = 0;
      } else {

        normalizedHeight = 0.3;
      }
    } else {

      normalizedHeight = (value - minValue) / valueRange;

      normalizedHeight = Math.pow(normalizedHeight, 1 / amplificationFactor);
    }

    var proportionalHeight = normalizedHeight * (chartHeight - 2 * padding);


    if (valueRange >= 0.01) {
      proportionalHeight = Math.max(proportionalHeight, minHeight);
    }


    const zeroLineOffset = 14;
    const y = chartHeight - zeroLineOffset - proportionalHeight;
    return { x, y };
  }

  function createSmoothPath(points) {
    if (points.length < 2) return '';
    if (points.length === 2) return `M ${points[0].x} ${points[0].y} L ${points[1].x} ${points[1].y}`;

    var path = `M ${points[0].x} ${points[0].y}`;

    for (var i = 0; i < points.length - 1; i++) {
      const current = points[i];
      const next = points[i + 1];
      const prev = i > 0 ? points[i - 1] : points[i];
      const nextNext = i < points.length - 2 ? points[i + 2] : points[i + 1];


      const currentValue = data[i];
      const nextValue = data[i + 1];
      const prevValue = i > 0 ? data[i - 1] : currentValue;
      const nextNextValue = i < data.length - 2 ? data[i + 2] : nextValue;

      const tension = 0.4;

      const d01 = Math.sqrt(Math.pow(current.x - prev.x, 2) + Math.pow(current.y - prev.y, 2));
      const d12 = Math.sqrt(Math.pow(next.x - current.x, 2) + Math.pow(next.y - current.y, 2));
      const d23 = Math.sqrt(Math.pow(nextNext.x - next.x, 2) + Math.pow(nextNext.y - next.y, 2));

      var fa = tension * d12 / (d01 + d12 || 1);
      var fb = tension * d12 / (d12 + d23 || 1);


      const yDiff = Math.abs(next.y - current.y);
      const threshold = 3;


      if (currentValue === nextValue || yDiff < threshold) {

        path += ` L ${next.x} ${next.y}`;
        continue;
      } else if (prevValue === currentValue && nextValue !== currentValue) {

        fa = 0.2;
      } else if (currentValue !== nextValue && nextValue === nextNextValue) {

        fb = 0.2;
      }

      const cp1x = current.x + fa * (next.x - prev.x);
      const cp1y = current.y + fa * (next.y - prev.y);
      const cp2x = next.x - fb * (nextNext.x - current.x);
      const cp2y = next.y - fb * (nextNext.y - current.y);

      path += ` C ${cp1x} ${cp1y}, ${cp2x} ${cp2y}, ${next.x} ${next.y}`;
    }

    return path;
  }

  var points = [];
  data.forEach((value, index) => {
    const coords = getCoords(index, value);
    points.push(coords);
  });


  const lineEl = document.getElementById('savingsLinePath');
  const areaEl = document.getElementById('savingsAreaPath');

  const smoothLinePath = createSmoothPath(points);
  const bottomRightPoint = points[points.length - 1];
  const bottomLeftPoint = points[0];
  const smoothAreaPath = createSmoothPath(points) + ` L ${bottomRightPoint.x} ${chartHeight} L ${bottomLeftPoint.x} ${chartHeight} Z`;


  if (lineEl) {
    if (isUpdateAnimation && previousSavingsChartPoints) {

      animatePathTransition(lineEl, previousSavingsChartPoints, points, false, chartHeight, 600);
    } else {
      lineEl.setAttribute('d', smoothLinePath);
      if (shouldAnimate) {

        lineEl.style.strokeDasharray = 'none';
        lineEl.style.strokeDashoffset = '0';
        lineEl.style.opacity = '0';
      } else {

        lineEl.style.opacity = '1';
        lineEl.style.strokeDasharray = 'none';
        lineEl.style.strokeDashoffset = '0';
      }
    }
  }

  if (areaEl) {
    if (isUpdateAnimation && previousSavingsChartPoints) {

      animatePathTransition(areaEl, previousSavingsChartPoints, points, true, chartHeight, 600);
    } else {
      areaEl.setAttribute('d', smoothAreaPath);
      if (shouldAnimate) {

        areaEl.style.opacity = '0';
      } else {

        areaEl.style.opacity = '1';
      }
    }
  }


  if (shouldAnimate && lineEl) {

    requestAnimationFrame(() => {
      requestAnimationFrame(() => {

        void lineEl.offsetWidth;

        const pathLength = getPathLength(lineEl);
        if (pathLength > 0) {

          lineEl.style.strokeDasharray = pathLength + ' ' + pathLength;
          lineEl.style.strokeDashoffset = pathLength;
          lineEl.style.transition = 'none';
          lineEl.style.opacity = '1';


          requestAnimationFrame(() => {
            lineEl.style.transition = 'stroke-dashoffset 1s ease-out, opacity 0.3s ease-out';
            lineEl.style.strokeDashoffset = '0';
          });
        } else {

          lineEl.style.opacity = '0';
          requestAnimationFrame(() => {
            lineEl.style.transition = 'opacity 0.5s ease-out';
            lineEl.style.opacity = '1';
          });
        }
      });
    });
  }


  if (shouldAnimate && areaEl) {
    setTimeout(() => {
      areaEl.style.transition = 'opacity 0.6s ease-out';
      areaEl.style.opacity = '1';
    }, 300);
  }

  const pointsGroup = document.getElementById('savingsPointsGroup');
  const labelContainer = document.getElementById('savingsChartLabels');


  let oldPoints = null;
  if (isUpdateAnimation) {
    oldPoints = previousSavingsChartPoints;
  }


  pointsGroup.innerHTML = '';
  if (labelContainer) labelContainer.innerHTML = '';

  data.forEach((value, index) => {
    const coords = getCoords(index, value);
    const circle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');

    if (isUpdateAnimation && oldPoints && oldPoints[index]) {

      circle.setAttribute('cx', oldPoints[index].x);
      circle.setAttribute('cy', oldPoints[index].y);
      circle.setAttribute('r', '4');
      circle.style.opacity = '1';

      animateCircleTransition(circle, oldPoints[index].x, oldPoints[index].y, coords.x, coords.y, 600);
    } else {
      circle.setAttribute('cx', coords.x);
      circle.setAttribute('cy', coords.y);
      if (shouldAnimate) {
        circle.setAttribute('r', '0');
        circle.style.opacity = '0';
        circle.style.transition = 'r 0.3s ease-out, opacity 0.3s ease-out';
      } else {
        circle.setAttribute('r', '4');
        circle.style.opacity = '1';
        circle.style.transition = '.1s';
      }
    }
    circle.setAttribute('fill', '#1f5eff');
    circle.setAttribute('stroke', '#272727');
    circle.setAttribute('stroke-width', '2');
    circle.style.cursor = 'pointer';

    circle.addEventListener('mouseenter', function (e) {
      this.setAttribute('r', '6');
      this.setAttribute('fill', '#1f5eff');
      this.setAttribute('stroke', '#272727');


      showCustomTooltip(this, `${labels[index]}: ${formatCurrency(value)}`);
    });

    circle.addEventListener('mouseleave', function () {
      this.setAttribute('r', '4');
      this.setAttribute('fill', '#1f5eff');
      this.setAttribute('stroke', '#272727');
      hideCustomTooltip();
    });

    pointsGroup.appendChild(circle);


    if (shouldAnimate) {
      setTimeout(() => {
        circle.setAttribute('r', '4');
        circle.style.opacity = '1';
      }, 600 + (index * 50));
    }

    if (labelContainer) {
      const label = document.createElement('div');
      label.className = 'chart-label';
      label.textContent = labels[index];
      if (shouldAnimate) {
        label.style.opacity = '0';
        label.style.transition = 'opacity 0.3s ease-out';
        labelContainer.appendChild(label);


        setTimeout(() => {
          label.style.opacity = '1';
        }, 800 + (index * 30));
      } else {
        labelContainer.appendChild(label);
      }
    }
  });


  previousSavingsChartPoints = points.map(p => ({ x: p.x, y: p.y }));
}


async function preloadTransactions() {
  try {
    const res = await fetch(`https://${GetParentResourceName()}/getTransactions`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({})
    });

    if (!res.ok) {
      throw new Error(`HTTP error! status: ${res.status}`);
    }

    const payload = await res.json();
    playerTransactions = normalizeTransactionsPayload(payload);
    return playerTransactions;
  } catch (error) {

    playerTransactions = [];
    return playerTransactions;
  }
}

function loadAllTransactions(preloadedTxs) {
  const txs = Array.isArray(preloadedTxs) ? preloadedTxs : getActiveTransactions();

  __txPager = { ...(__txPager || {}), txs, originalTxs: txs };


  const searchInput = document.getElementById('transactionsSearch');
  if (searchInput) {
    searchInput.value = '';
  }


  const itemBody = document.querySelector('.ib-transactions');
  if (itemBody) {

    const existingNoInfo = itemBody.querySelector('.tr-noinfo');
    if (existingNoInfo) {
      existingNoInfo.remove();
    }


    let transactionsHeader = itemBody.querySelector('.transactions-header');
    let transactionsList = itemBody.querySelector('.transactions-list');
    let transactionsPagination = itemBody.querySelector('.transactions-pagination');

    if (!transactionsHeader || !transactionsList || !transactionsPagination) {
      itemBody.innerHTML = `
        <div class="transactions-header">
          <div class="th-type">${_L('ui_type')}</div>
          <div class="th-description">${_L('ui_description')}</div>
          <div class="th-date">${_L('ui_date')}</div>
          <div class="th-amount">${_L('ui_amount')}</div>
          <div class="th-actions">${_L('ui_actions')}</div>
        </div>
        <div class="transactions-list"></div>
        <div class="transactions-pagination">
          <div class="pagination-controls"></div>
        </div>`;
    }
  }


  initTransactionsPager();


  applyAccountFilter();
  updateTransactionsStatistics(__txPager.txs);
}

function updateTransactionsStatistics(txs) {
  var received = 0, sent = 0;

  for (const tx of txs) {
    const sign = txSignForSelf(tx);
    const v = Math.max(0, toNumber(tx.value));
    if (sign > 0) received += v;
    else if (sign < 0) sent += v;
  }

  const net = received - sent;

  const elTotal = document.getElementById('totalTransactions');
  const elRecv = document.getElementById('totalReceived');
  const elSent = document.getElementById('totalSent');
  const elNet = document.getElementById('netEarnings');

  if (elTotal) elTotal.textContent = txs.length.toLocaleString();
  if (elRecv) {
    elRecv.textContent = `${formatCurrency(received)}`;
    if (received <= 0) {
      elRecv.classList.remove('positive');
      elRecv.classList.add('negative');
    } else {
      elRecv.classList.add('positive');
      elRecv.classList.remove('negative');
    }
  }
  if (elSent) elSent.textContent = `${formatCurrency(sent)}`;
  if (elNet) {
    var value = `${formatCurrency(Math.abs(net))}`;
    elNet.classList.remove('positive', 'negative', 'earnings');
    if (net <= 0) {
      if (net < 0) {
        value = `- ${value}`;
      }
      elNet.classList.add('negative');
    } else {
      value = `+ ${value}`;
      elNet.classList.add('earnings');
    }
    elNet.textContent = value;
  }
}


window.addEventListener('message', async function (event) {
  if (event.data.action === 'loading') {

    if (!isBankOpen) {
      $('#menu').html(`
        <div class="loading-stack">
            <span class="load"></span>
            <div class="ldata-txt">${_L('ui_loading_data')}</div>
        </div>
      `);
      $("#menu").fadeIn();
      $(".main_card").fadeIn();
    }
  } else if (event.data.action === 'openBank') {

    if (isClosing) return;

    isBankOpen = true;
    isInitialBankOpen = true;
    isClosing = false;
    isATMMode = false;


    const bankOpenStartTime = Date.now();

    playerData = event.data.playerInfo || {};
    societyData = event.data.societyInfo || {};


    updateAvatar();


    if (playerData.savings && typeof playerData.savings === 'object') {

      playerData.savings.balance = playerData.savings.balance || 0;
      playerData.savings.interestRate = playerData.savings.interestRate || 2.5;
    } else {

      playerData.savings = {
        balance: 0,
        interestRate: 2.5,
        totalEarned: 0,
        thisWeekProjected: 0,
        nextPayoutWhenUtc: ""
      };
    }


    if (societyData && societyData.savings && typeof societyData.savings === 'object') {

      societyData.savings.balance = societyData.savings.balance || 0;
      societyData.savings.interestRate = societyData.savings.interestRate || 2.0;
    } else if (societyData && Object.keys(societyData).length > 0) {

      societyData.savings = {
        balance: 0,
        interestRate: 2.0,
        totalEarned: 0,
        thisWeekProjected: 0,
        nextPayoutWhenUtc: ""
      };
    }

    activeLoans = Array.isArray(event.data.loans) ? event.data.loans : [];


    updateNavbarLoanWarning(activeLoans);

    useBilling = event.data.useBilling || false;

    if (useBilling) {
      playerBills = event.data.playerBills || [];
      societyBills = event.data.societyBills || [];
    } else {
      $('#navbar-items .nav-item.bills').remove();
    }


    societyTransactions = event.data.societyTransactions || [];


    loadConfigurationFallback(event.data);


    customAccountsData = event.data.customAccounts || [];

    registerOrUpdateAccounts();
    currentAccountType = 'personal';


    const businessAccountOption = document.querySelector('.account-option[onclick="selectAccount(\'business\')"]');
    if (businessAccountOption) {
      const hasValidSocietyData = societyData &&
        Object.keys(societyData).length > 0 &&
        (societyData.society || societyData.society_name || societyData.pincode || societyData.value !== undefined);
      if (hasValidSocietyData) {
        businessAccountOption.style.display = 'flex';
      } else {
        businessAccountOption.style.display = 'none';
      }
    }


    const dropdown = document.getElementById('accountDropdownMenu');
    const createNewOption = dropdown ? dropdown.querySelector('.create-new-option') : null;


    if (dropdown) {
      const existingCustomAccounts = dropdown.querySelectorAll('.account-option[data-account-identifier]');
      existingCustomAccounts.forEach(option => option.remove());
    }


    if (dropdown && createNewOption && Array.isArray(customAccountsData)) {
      customAccountsData.forEach(account => {
        if (account && account.account_identifier) {

          const existingOption = dropdown.querySelector(`.account-option[data-account-identifier="${account.account_identifier}"]`);
          if (existingOption) return;

          const accountOption = document.createElement('div');
          accountOption.className = 'account-option';
          accountOption.setAttribute('onclick', `selectAccount('custom_${account.account_identifier}')`);
          accountOption.setAttribute('data-account-identifier', account.account_identifier);

          const accountName = account.account_name || account.owner_name || account.account_identifier;

          const accountData = customAccountsData.find(acc => acc.account_identifier === account.account_identifier) || account;
          const accountTypeText = accountData.is_owner ? _L('ui_owner') : _L('ui_user');

          accountOption.innerHTML = `
            <div class="account-info">
              <div class="account-name">${accountName}</div>
              <div class="account-type">${accountTypeText}</div>
            </div>
          `;


          dropdown.insertBefore(accountOption, createNewOption);
        }
      });
    }


    setTimeout(() => reorganizeAccountDropdown(), 100);


    try {
      await preloadTransactions();
    } catch (e) {

      playerTransactions = normalizeTransactionsPayload(event.data.transactions);
    }


    $('.char-name').text(limitCharacters(playerData.playerName, 12, true) || '');
    $('.iban').text(playerData.playerIBAN || '');
    switchPage('overview');


    preloadSavingsGoals().catch(() => { });
    preloadActiveLoans().catch(() => { });


    requestAnimationFrame(() => {
      selectAccount('personal');

      setTimeout(() => {
        isInitialBankOpen = false;
      }, 100);
    });


    const timeElapsed = Date.now() - bankOpenStartTime;
    const minimumDelay = 1000;
    const remainingDelay = Math.max(0, minimumDelay - timeElapsed);


    setTimeout(() => {

      if (!isBankOpen || isClosing) {

        $("#menu").fadeOut();
        $(".main_card").fadeOut();
        const ctn = document.querySelector('.container');
        if (ctn) ctn.style.display = 'none';
        return;
      }

      const ctn = document.querySelector('.container');
      if (ctn) ctn.style.display = 'flex';
      $(".info").show();
      $("#menu").fadeOut();
      $(".main_card").fadeOut();

      $('#navbar-items .nav-item').show();

      if (currentAccountType && currentAccountType.startsWith('custom_')) {
        $('#navbar-items .nav-item.bills').hide();
      }

      updateLoansTabVisibility(openedAccount);
      $('.account-current').show();
      $('.view-transactions').show();


      initializeAccountDropdown();


      if (pendingChartAnimation && pendingChartAnimation.type === 'overview') {

        setTimeout(() => {
          renderBalanceChart(pendingChartAnimation.labels, pendingChartAnimation.data, pendingChartAnimation.shouldAnimate || true);
          pendingChartAnimation = null;
        }, 70);
      }
    }, remainingDelay);
  } else if (event.data.action === 'updateLoans') {

    if (event.data.bankBalance !== undefined) {
      updatePlayerMoney(event.data.bankBalance);
    }

    if (event.data.loans && Array.isArray(event.data.loans)) {
      activeLoans = event.data.loans;
      updateNavbarLoanWarning(activeLoans);

      if (currentPage === 'loans') {
        renderActiveLoans(activeLoans);
      }
    }
  } else if (event.data.action === 'updateSavingsData') {
    const savingsData = event.data.data;
    const targetAccount = event.data.openedAccount || openedAccount;

    if (savingsData) {
      if (targetAccount === 'business') {
        if (societyData) {
          societyData.savings = savingsData;
        }
      } else if (targetAccount && targetAccount.startsWith('custom_')) {
        if (customAccountsData) {
          for (let i = 0; i < customAccountsData.length; i++) {
            if (customAccountsData[i].account_identifier === targetAccount.replace('custom_', '')) {
              customAccountsData[i].savings = savingsData;
              break;
            }
          }
        }
      } else {
        playerData.savings = savingsData;
      }
    }

    if (currentPage === 'savings') {
      renderSavingsInfo();
    }


    if (currentPage === 'savings') {
      renderSavingsInfo();
    }
  } else if (event.data.action === 'updatePlayerMoney') {

    if (event.data.bankBalance !== undefined) {
      const accountType = event.data.accountType || currentAccountType;
      const isBusinessAccount = accountType === 'business';
      const isCustomAccount = accountType && accountType.startsWith('custom_');

      if (isBusinessAccount && societyData && currentAccountType === 'business') {
        societyData.value = event.data.bankBalance;
        if (currentAccountType === 'business') {
          updatePlayerMoney(event.data.bankBalance);
        }
      } else if (isCustomAccount && currentAccountType.startsWith('custom_')) {
        const accountIdentifier = accountType.replace('custom_', '');
        const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
        if (customAccount) {
          customAccount.balance = event.data.bankBalance;
        }

        const accountKey = accountType;
        if (accounts[accountKey] && accounts[accountKey].accountData) {
          accounts[accountKey].accountData.balance = event.data.bankBalance;
        }
        if (currentAccountType.startsWith('custom_')) {
          updatePlayerMoney(event.data.bankBalance);
        }
      } else {

        playerData.playerBankMoney = event.data.bankBalance;
        if (currentAccountType === 'personal') {
          updatePlayerMoney(event.data.bankBalance);
        }
      }
    }


    if (event.data.transactions && Array.isArray(event.data.transactions) && currentAccountType === 'personal') {
      const normalizedTxs = normalizeTransactionsPayload(event.data.transactions);
      setActiveTransactions(normalizedTxs);
      playerTransactions = normalizedTxs;


      if (currentPage === 'overview') {
        populateLastTransactions(normalizedTxs);
        populateBalanceChartFromTransactions(normalizedTxs);
      } else if (currentPage === 'transactions') {
        loadAllTransactions(normalizedTxs);
      }
      applyCurrentAccountToUI();
    }
  } else if (event.data.action === 'updateTransactions') {

    if (event.data.transactions && Array.isArray(event.data.transactions)) {
      const normalizedTxs = normalizeTransactionsPayload(event.data.transactions);


      if (currentAccountType === 'personal') {
        setActiveTransactions(normalizedTxs);
        if (currentPage === 'overview') {
          populateLastTransactions(normalizedTxs);
          populateBalanceChartFromTransactions(normalizedTxs);
        } else if (currentPage === 'transactions') {
          loadAllTransactions(normalizedTxs);
        }
        applyCurrentAccountToUI();
      } else if (currentAccountType === 'business') {
        societyTransactions = normalizedTxs;
        setActiveTransactions(normalizedTxs);
        if (currentPage === 'overview') {
          populateLastTransactions(normalizedTxs);
          populateBalanceChartFromTransactions(normalizedTxs);
        } else if (currentPage === 'transactions') {
          loadAllTransactions(normalizedTxs);
        }
        applyCurrentAccountToUI();
      } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
        const accountIdentifier = currentAccountType.replace('custom_', '');
        const accountKey = currentAccountType;
        if (accounts[accountKey]) {
          accounts[accountKey].accountData.transactions = normalizedTxs;
        }
        const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
        if (customAccount) {
          customAccount.transactions = normalizedTxs;
        }
        setActiveTransactions(normalizedTxs);
        if (currentPage === 'overview') {
          populateLastTransactions(normalizedTxs);
          populateBalanceChartFromTransactions(normalizedTxs);
        } else if (currentPage === 'transactions') {
          loadAllTransactions(normalizedTxs);
        }
        applyCurrentAccountToUI();
      }
    }
  } else if (event.data.action === 'openPinMenu') {

    isBankOpen = true;
    isClosing = false;
    selectedPin = '';
    isATMMode = true;
    onATMSelectAccount = true;

    playerData = event.data.accountInfo;
    playerTransactions = event.data.transactions;


    if (event.data.societyInfo && Object.keys(event.data.societyInfo).length > 0) {
      societyData = event.data.societyInfo;
    }


    if (event.data.customAccounts && Array.isArray(event.data.customAccounts)) {
      customAccountsData = event.data.customAccounts;
    }


    updateAvatar();


    if (playerData.accountType === 'business') {

      currentAccountType = 'business';


      if (playerData.society) {
        societyData = {
          society: playerData.society,
          society_name: playerData.society_name || playerData.society,
          value: playerData.playerBankMoney || 0,
          iban: playerData.playerIBAN || ''
        };
      }


      if (event.data.transactions) {
        societyTransactions = normalizeTransactionsPayload(event.data.transactions);
      } else {
        societyTransactions = [];
      }


      if (playerData.playerPIN) {

        businessCardsData = JSON.stringify([playerData.playerPIN]);
      } else {
        businessCardsData = "[]";
      }
    } else if (playerData.accountType === 'custom') {

      currentAccountType = 'custom_' + (playerData.account_identifier || playerData.playerCitizenId);


      const accountIdentifier = playerData.account_identifier || playerData.playerCitizenId;
      if (accountIdentifier) {

        customAccountsData = customAccountsData || [];
        const existingIndex = customAccountsData.findIndex(acc => acc.account_identifier === accountIdentifier);
        const accountData = {
          account_identifier: accountIdentifier,
          account_holder: playerData.playerCitizenId,
          owner_name: playerData.owner_name || '',
          account_name: playerData.account_name || playerData.owner_name || '',
          balance: playerData.playerBankMoney || 0,
          iban: playerData.playerIBAN || 'N/A',
          pincode: playerData.playerPIN ? JSON.stringify([playerData.playerPIN]) : null,
          account_type: 'custom',
          is_owner: true,
          permissions: {
            deposit: true,
            withdraw: true,
            transfer: true,
            loans: true
          },
          transactions: playerTransactions || []
        };

        if (existingIndex !== -1) {
          customAccountsData[existingIndex] = accountData;
        } else {
          customAccountsData.push(accountData);
        }


        if (playerData.playerPIN) {
          customAccountCardsData[accountIdentifier] = [playerData.playerPIN];
        } else {
          customAccountCardsData[accountIdentifier] = [];
        }


        const accountKey = currentAccountType;
        accounts[accountKey] = {
          key: accountKey,
          name: () => accountData.account_name || accountData.owner_name || '',
          iban: () => accountData.iban || 'N/A',
          citizenId: () => accountData.account_holder || '',
          bankMoney: () => toNumber(accountData.balance || 0),
          walletMoney: () => toNumber(playerData?.playerWalletMoney || 0),
          transactions: function () {
            if (this.accountData && this.accountData.transactions) {
              return this.accountData.transactions;
            }
            return [];
          },
          preload: async () => { return []; },
          accountData: accountData
        };
      }
    } else {

      currentAccountType = 'personal';


      if (isATMMode) {
        atmCardOwnerCitizenId = playerData.playerCitizenId;
        atmCardOwnerBalance = playerData.playerBankMoney || 0;
      }


      if (event.data.transactions) {
        playerTransactions = normalizeTransactionsPayload(event.data.transactions);
      } else {
        playerTransactions = [];
      }
    }

    switchPage('pin');

    $(".container").fadeIn();
    $("#menu").fadeOut();
    $(".main_card").fadeOut();
    $(".info").hide();
  } else if (event.data.action === 'openAccountSelectionMenu') {
    isBankOpen = true;
    isClosing = false;
    selectedPin = '';
    isATMMode = true;
    onATMSelectAccount = true;

    accountSelectionCards = event.data.cards;


    switchPage('accountSelection');

    const accountSelectionBody = document.querySelector('.select-account-body');
    var accountSelectionBodyHTML = '';

    for (var i = 0; i < event.data.cards.length; i++) {
      const cardNumber = event.data.cards[i].info['Card Number'];
      const maskedCardNumber = maskCardNumber(cardNumber);
      accountSelectionBodyHTML += `
        <div class="select-account-option" onclick="selectCardAccount(${i})">
            <div class="sa-info">
                <div class="sa-name">${event.data.cards[i].info['Card Holder']}</div>
                <div class="sa-number">${maskedCardNumber}</div>
            </div>
        </div>
      `;
    }

    accountSelectionBody.innerHTML = accountSelectionBodyHTML;

    $(".container").fadeIn();
    $("#menu").fadeOut();
    $(".main_card").fadeOut();
    $(".info").hide();
  } else if (event.data.action === 'showReceipt') {
    showReceipt(event.data.invoice);
  } else if (event.data.action === 'showTransactionReceipt') {
    showTransactionReceipt(event.data.transaction);
  }
});

function showReceipt(invoice) {
  if (!invoice) {
    console.error('No invoice data provided');
    return;
  }
  isReceiptOpen = true;


  const billId = invoice.id || 'N/A';
  const status = String(invoice.status || '').toLowerCase();
  const isPaid = status === 'paid';
  const invoiceValue = toNumber(invoice.invoice_value || 0);
  const vatAmount = Math.round(invoiceValue * (vatPercent / 100));
  const subtotal = invoiceValue - vatAmount;
  const refId = invoice.ref_id || invoice.id || 'N/A';
  const sentDate = formatBillDate(invoice.sent_date);
  const dueDate = formatBillDate(invoice.limit_pay_date);
  const paidDate = formatBillDate(invoice.paid_date || invoice.limit_pay_date);
  const receiverName = invoice.receiver_name || 'N/A';
  const senderName = invoice.author_name || invoice.society_name || invoice.item || 'N/A';
  const item = invoice.item || 'N/A';
  const notes = invoice.notes || 'N/A';


  const receiptTitle = document.getElementById('receipt-title');
  if (receiptTitle) {
    receiptTitle.textContent = `Invoice #${billId}`;
  }


  const receiptStatus = document.getElementById('receipt-status');
  if (receiptStatus) {
    receiptStatus.className = `receipt-status ${isPaid ? 'receipt-paid' : 'receipt-unpaid'}`;
    receiptStatus.textContent = isPaid ? 'PAID' : 'UNPAID';
  }


  const receiptRefId = document.getElementById('receipt-refid');
  if (receiptRefId) {
    receiptRefId.textContent = `Reference ID: ${refId}`;
  }


  const receiptDates = document.getElementById('receipt-dates');
  if (receiptDates) {
    receiptDates.innerHTML = `
      Sent: ${sentDate || 'N/A'}
      <br>
      Due: ${dueDate || 'N/A'}
    `;
  }


  const receiptToFrom = document.getElementById('receipt-to-from');
  if (receiptToFrom) {
    receiptToFrom.innerHTML = `
      To: ${receiverName}
      <br>
      From: ${senderName}
    `;
  }


  const receiptNotes = document.getElementById('receipt-notes');
  if (receiptNotes) {
    receiptNotes.innerHTML = `Notes: ${notes || 'N/A'}`;
  }


  const receiptItemName = document.getElementById('receipt-item-name');
  if (receiptItemName) {
    receiptItemName.textContent = item;
  }
  const receiptPreVatValue = document.getElementById('receipt-item-value');
  const receiptSubtotalValue = document.getElementById('receipt-subtotal');
  if (receiptPreVatValue && receiptSubtotalValue) {
    receiptPreVatValue.textContent = formatCurrency(subtotal);
    receiptSubtotalValue.textContent = formatCurrency(subtotal);
  }


  const receiptVatValue = document.getElementById('receipt-vat-value');
  if (receiptVatValue) {
    receiptVatValue.textContent = formatCurrency(vatAmount);
  }
  const receiptVatLabel = document.getElementById('receipt-vat-label');
  if (receiptVatLabel) {
    receiptVatLabel.textContent = `VAT (${vatPercent}%)`;
  }


  const receiptPaidTxt = document.getElementById('receipt-paid-txt');
  if (receiptPaidTxt) {
    if (isPaid && paidDate) {
      receiptPaidTxt.textContent = `Paid on ${paidDate}`;
      receiptPaidTxt.style.display = '';
    } else {
      receiptPaidTxt.style.display = 'none';
    }
  }

  const receiptTotalValue = document.getElementById('receipt-total');
  if (receiptTotalValue) {
    receiptTotalValue.textContent = formatCurrency(invoiceValue);
  }

  $('.receipt').fadeIn();
}

function showTransactionReceipt(transaction) {
  if (!transaction) {
    console.error('No transaction data provided');
    return;
  }

  isTransactionReceiptOpen = true;


  let formattedDate = transaction["Date"] || '';
  const dateMatch = String(transaction["Date"] || '').match(/^(\d{4})\/(\d{2})\/(\d{2})\s*-\s*(\d{2}):(\d{2}):(\d{2})$/);
  if (dateMatch) {
    const [, yyyy, mm, dd, HH, MM, SS] = dateMatch;
    const d = new Date(`${yyyy}-${mm}-${dd}T${HH}:${MM}:${SS}`);
    const monthNames = ['January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'];
    const monthName = monthNames[parseInt(mm, 10) - 1];
    const day = parseInt(dd, 10);
    const year = parseInt(yyyy, 10);
    const timePart = `${String(HH).padStart(2, '0')}:${String(MM).padStart(2, '0')}`;
    formattedDate = `${day} ${monthName} ${year}, ${timePart}`;
  }


  const typeEl = document.getElementById('transaction-receipt-type');
  if (typeEl) {
    typeEl.textContent = transaction["Type"] || 'Transaction';
  }

  const dateEl = document.getElementById('transaction-receipt-date');
  if (dateEl) {
    dateEl.textContent = formattedDate;
  }

  const fromEl = document.getElementById('transaction-receipt-from');
  if (fromEl) {
    fromEl.textContent = transaction["From"] || 'N/A';
  }

  const senderIbanEl = document.getElementById('transaction-receipt-sender-iban');
  if (senderIbanEl) {
    const iban = transaction["Sender IBAN"] || 'N/A';
    senderIbanEl.textContent = iban;
    if (iban === 'N/A') {
      senderIbanEl.style.fontFamily = 'tajawal';
    } else {
      senderIbanEl.style.fontFamily = '';
    }
  }

  const toEl = document.getElementById('transaction-receipt-to');
  if (toEl) {
    toEl.textContent = transaction["To"] || 'N/A';
  }

  const receiverIbanEl = document.getElementById('transaction-receipt-receiver-iban');
  if (receiverIbanEl) {
    const iban = transaction["Receiver IBAN"] || 'N/A';
    receiverIbanEl.textContent = iban;
    if (iban === 'N/A') {
      receiverIbanEl.style.fontFamily = 'tajawal';
    } else {
      receiverIbanEl.style.fontFamily = '';
    }
  }

  const totalEl = document.getElementById('transaction-receipt-total');
  if (totalEl) {
    const value = toNumber(transaction["Total"] || 0);
    totalEl.textContent = formatCurrency(value);
  }


  $('.receipt-t').fadeIn();
}

var isOpeningATMAccount = false;

function selectCardAccount(index) {
  if (!isOpeningATMAccount) {
    isOpeningATMAccount = true;
    $(".container").fadeOut();
    setTimeout(() => {
      const url = `https://${GetParentResourceName()}/selectCardAccount`;
      $.post(url, JSON.stringify({ card: accountSelectionCards[index] }));
      accountSelectionCards = [];
      isOpeningATMAccount = false;
    }, 300);
  }
}

function insertPin(value) {
  if (value === 'C') {
    selectedPin = '';
    $('.pin-dot').removeAttr('style');
  } else if (value === 'OK' && selectedPin.length === 4) {
    if (selectedPin === playerData.playerPIN.pincode) {
      playerData.playerPIN[selectedCardIndex] = {
        pincode: selectedPin,
      };
      playerData.playerPIN = JSON.stringify(playerData.playerPIN);

      $('.pin-dot').css('background-color', '#22c55e');

      const dotsEl = document.querySelector('.pin-dots');
      if (dotsEl) dotsEl.classList.add('pin-success');

      setTimeout(() => {
        if (dotsEl) dotsEl.classList.remove('pin-success');
        openCardOverview();
      }, 600);
    } else {


      $('.pin-dot').css('background-color', '#ff0000');

      const dotsEl = document.querySelector('.pin-dots');
      if (dotsEl) dotsEl.classList.add('pin-error');

      setTimeout(() => {
        if (dotsEl) dotsEl.classList.remove('pin-error');
        $('.pin-dot').removeAttr('style');
        selectedPin = '';
      }, 600);
    }
  } else if (value !== 'OK' && value !== 'C') {

    if (selectedPin.length === 4) {
      selectedPin = selectedPin;
    } else {
      selectedPin += value;
    }
    document.querySelector(`.pin-dot-${selectedPin.length}`).style.backgroundColor = '#1f5eff';
  }
}

function openCardOverview() {
  isInitialBankOpen = true;
  const loadingMarkup = `
    <div class="loading-stack">
        <span class="load"></span>
        <div class="ldata-txt">${_L('ui_loading_data')}</div>
    </div>`;
  $('#menu').html(loadingMarkup).fadeIn();
  $('.main_card').fadeIn();
  const ctnHide = document.querySelector('.container');
  if (ctnHide) ctnHide.style.display = 'none';

  const bankOpenStartTime = Date.now();


  switchPage('overview');

  $(".container").fadeOut();
  $("#menu").fadeIn();
  $(".main_card").fadeIn();
  $(".info").show();


  const timeElapsed = Date.now() - bankOpenStartTime;
  const minimumDelay = 1000;
  const remainingDelay = Math.max(0, minimumDelay - timeElapsed);


  try { registerOrUpdateAccounts(); } catch (_) { }


  if (!currentAccountType || currentAccountType === 'card') {
    currentAccountType = 'card';
  }

  $('#navbar-items .nav-item').not('.overview').hide();
  $('.account-current').hide();
  $('.view-transactions').hide();


  const transactionsToUse = (currentAccountType === 'business' && societyTransactions) ? societyTransactions : playerTransactions;
  populateLastTransactions(transactionsToUse);


  populateBalanceChartFromTransactions(transactionsToUse);


  setTimeout(() => {

    if (!isBankOpen || isClosing) {

      $("#menu").fadeOut();
      $(".main_card").fadeOut();
      const ctn = document.querySelector('.container');
      if (ctn) ctn.style.display = 'none';
      return;
    }

    const ctn = document.querySelector('.container');
    if (ctn) ctn.style.display = 'flex';
    $(".info").show();
    $("#menu").fadeOut();
    $(".main_card").fadeOut();


    if (pendingChartAnimation && pendingChartAnimation.type === 'overview') {

      setTimeout(() => {
        renderBalanceChart(pendingChartAnimation.labels, pendingChartAnimation.data, pendingChartAnimation.shouldAnimate || true);
        pendingChartAnimation = null;
      }, 70);
    }
  }, remainingDelay);

  $('.char-name').text(limitCharacters(playerData.playerName, 12, true) || '');
  $('.iban').text(playerData.playerIBAN || '');
  $('.balance-value').text(formatCurrency(playerData.playerBankMoney || 0));
  $('.wallet').text(formatCurrency(playerData.playerWalletMoney || 0));

  const accountUsersButton = document.querySelector('.account-users-button');
  const editPinButton = document.querySelector('.edit-pin');
  const editIBANButton = document.querySelector('.edit-iban');
  const createBtn = document.getElementById('createNewCardButton');

  if (accountUsersButton) {
    accountUsersButton.disabled = true;
    accountUsersButton.style.opacity = 0.5;
    accountUsersButton.style.cursor = 'default';
    accountUsersButton.style.pointerEvents = 'none';
  }
  if (editPinButton) {
    editPinButton.disabled = true;
    editPinButton.style.opacity = 0.5;
    editPinButton.style.cursor = 'default';
    editPinButton.style.pointerEvents = 'none';
  }
  if (editIBANButton) {
    editIBANButton.disabled = true;
    editIBANButton.style.opacity = 0.5;
    editIBANButton.style.cursor = 'default';
    editIBANButton.style.pointerEvents = 'none';
  }
  if (createBtn) {

    var cardsInfo = getCurrentCards();
    const totalCardsCount = cardsInfo.length;
    const activeCardsCount = cardsInfo.filter(card => card.status === 'active').length;
    const isMaxTotalCardsReached = cardsConfig.maxTotalCreditCards > 0 && totalCardsCount >= cardsConfig.maxTotalCreditCards;
    const isMaxActiveCardsReached = cardsConfig.maxCreditCards > 0 && activeCardsCount >= cardsConfig.maxCreditCards;
    const isMaxCardsReached = isMaxTotalCardsReached || isMaxActiveCardsReached;


    if (isATMMode) {
      createBtn.disabled = true;
      createBtn.style.opacity = '0.5';
      createBtn.style.cursor = 'default';
      createBtn.style.color = '#fff';
      createBtn.style.pointerEvents = 'none';
      createBtn.classList.remove('disabled');


      const tooltipHandlers = createBtn._tooltipHandlers || {};
      if (tooltipHandlers.mouseenter) {
        createBtn.removeEventListener('mouseenter', tooltipHandlers.mouseenter);
        createBtn.removeEventListener('mouseleave', tooltipHandlers.mouseleave);
      }
      if (tooltipHandlers.click) {
        createBtn.removeEventListener('click', tooltipHandlers.click, true);
      }
      createBtn._tooltipHandlers = null;
    } else {
      createBtn.disabled = true;
      createBtn.style.opacity = '0.5';
      createBtn.style.cursor = 'default';
      createBtn.style.color = '#fff';


      if (isMaxCardsReached) {

        let tooltipMessage = 'You have reached the maximum number of cards';
        if (isMaxActiveCardsReached) {
          tooltipMessage = 'You have reached the maximum number of active cards';
        }
        createBtn.style.pointerEvents = 'auto';
        createBtn.classList.add('disabled');


        const tooltipHandlers = createBtn._tooltipHandlers || {};
        if (tooltipHandlers.mouseenter) {
          createBtn.removeEventListener('mouseenter', tooltipHandlers.mouseenter);
          createBtn.removeEventListener('mouseleave', tooltipHandlers.mouseleave);
        }
        if (tooltipHandlers.click) {
          createBtn.removeEventListener('click', tooltipHandlers.click, true);
        }


        tooltipHandlers.mouseenter = function () {
          showCustomTooltip(createBtn, tooltipMessage);
        };

        tooltipHandlers.mouseleave = function () {
          hideCustomTooltip();
        };


        tooltipHandlers.click = function (e) {
          e.preventDefault();
          e.stopPropagation();
          e.stopImmediatePropagation();
          return false;
        };


        createBtn._tooltipHandlers = tooltipHandlers;


        createBtn.addEventListener('mouseenter', tooltipHandlers.mouseenter);
        createBtn.addEventListener('mouseleave', tooltipHandlers.mouseleave);
        createBtn.addEventListener('click', tooltipHandlers.click, true);
      } else {

        createBtn.style.pointerEvents = 'none';
        createBtn.classList.remove('disabled');


        const tooltipHandlers = createBtn._tooltipHandlers || {};
        if (tooltipHandlers.mouseenter) {
          createBtn.removeEventListener('mouseenter', tooltipHandlers.mouseenter);
          createBtn.removeEventListener('mouseleave', tooltipHandlers.mouseleave);
        }
        if (tooltipHandlers.click) {
          createBtn.removeEventListener('click', tooltipHandlers.click, true);
        }
        createBtn._tooltipHandlers = null;
      }
    }
  }

  const cardButtonDailyLimit = document.getElementById('card-button-daily-limit');
  if (cardButtonDailyLimit) {
    cardButtonDailyLimit.disabled = true;
    cardButtonDailyLimit.style.opacity = 0;
    cardButtonDailyLimit.style.cursor = 'default';
    cardButtonDailyLimit.style.pointerEvents = 'none';
  }
  loadATMCardInfo()


  if (isATMMode) {
    const manageCardButton = document.getElementById('manageCardButton');
    const showPinButton = document.getElementById('showPinButton');
    const editPinButton = document.getElementById('editPinButton');
    const createBtn = document.getElementById('createNewCardButton');

    onATMSelectAccount = false;

    if (manageCardButton) {
      manageCardButton.disabled = true;
      manageCardButton.style.opacity = 0.5;
      manageCardButton.style.cursor = 'default';
      manageCardButton.style.pointerEvents = 'none';
    }
    if (showPinButton) {
      showPinButton.disabled = true;
      showPinButton.style.opacity = 0.5;
      showPinButton.style.cursor = 'default';
      showPinButton.style.pointerEvents = 'none';
    }
    if (editPinButton) {
      editPinButton.disabled = true;
      editPinButton.style.opacity = 0.5;
      editPinButton.style.cursor = 'default';
      editPinButton.style.pointerEvents = 'none';
    }
    if (createBtn) {
      createBtn.disabled = true;
      createBtn.style.opacity = '0.5';
      createBtn.style.cursor = 'default';
      createBtn.style.color = '#fff';
      createBtn.style.pointerEvents = 'none';
      createBtn.classList.remove('disabled');

      if (createBtn._tooltipHandlers) {
        createBtn.removeEventListener('mouseenter', createBtn._tooltipHandlers.mouseenter);
        createBtn.removeEventListener('mouseleave', createBtn._tooltipHandlers.mouseleave);
        createBtn.removeEventListener('click', createBtn._tooltipHandlers.click, true);
        createBtn._tooltipHandlers = null;
      }
    }
  } else {

    setCardsInfo();
  }
}

function loadATMCardInfo() {

  let cardInfo = null;

  if (currentAccountType === 'business') {

    if (playerData.playerPIN) {
      if (typeof playerData.playerPIN === 'string') {

        try {
          cardInfo = JSON.parse(playerData.playerPIN);
        } catch (e) {
          console.error('Error parsing business playerPIN string:', e);

          cardInfo = playerData.playerPIN;
        }
      } else {

        cardInfo = playerData.playerPIN;
      }
    } else if (businessCardsData) {

      try {
        const cards = typeof businessCardsData === 'string' ? JSON.parse(businessCardsData) : businessCardsData;
        if (cards && Array.isArray(cards) && cards.length > 0) {
          cardInfo = cards[0];
        }
      } catch (e) {
        console.error('Error parsing business cards:', e);
      }
    }
  } else {

    if (typeof playerData.playerPIN === 'string') {
      try {
        cardInfo = JSON.parse(playerData.playerPIN);
      } catch (e) {

        cardInfo = playerData.playerPIN;
      }
    } else {
      cardInfo = playerData.playerPIN;
    }
  }

  if (!cardInfo) {
    console.error('No card info available');
    return;
  }


  selectedCardIndex = 0;


  let cardHolderName = playerData.playerCardHolder || '';
  if (currentAccountType === 'business' && !cardHolderName) {
    cardHolderName = societyData?.society_name || playerData.society_name || '';
  }

  $('.cc-holder-name').text(cardHolderName);
  $('.cc-number').text(cardInfo.card_number || '');
  $('.cc-exp-date').text(formatExpirationDate(cardInfo.expiration_date || ''));
  $('.card-daily-limit').text(formatCurrency(cardInfo.daily_limit || 0));
  $('.card-limit-left').text('(' + formatCurrency((cardInfo.daily_limit || 0) - (cardInfo.today_spent || 0)) + ')');


  if (cardInfo.status === 'active') {
    $('#cc-status').text(_L('ui_active'));
    $('#cc-status').removeClass('pending');
    $('#cc-status').removeClass('blocked');
    $('.card-status').text(_L('ui_active'));
    $('.card-status').removeClass('ci-pending');
    $('.card-status').removeClass('ci-blocked');
    $('#cc-status').addClass('active');
    $('.card-status').addClass('ci-active');
  } else if (cardInfo.status === 'blocked') {
    $('#cc-status').text(_L('ui_blocked'));
    $('#cc-status').removeClass('active');
    $('#cc-status').removeClass('pending');
    $('.card-status').text(_L('ui_blocked'));
    $('.card-status').removeClass('ci-active');
    $('.card-status').removeClass('ci-pending');
    $('#cc-status').addClass('blocked');
    $('.card-status').addClass('ci-blocked');
  } else if (cardInfo.status === 'pending') {
    $('#cc-status').text(_L('ui_pending'));
    $('#cc-status').removeClass('active');
    $('#cc-status').removeClass('blocked');
    $('.card-status').text(_L('ui_pending'));
    $('.card-status').removeClass('ci-active');
    $('.card-status').removeClass('ci-blocked');
    $('#cc-status').addClass('pending');
    $('.card-status').addClass('ci-pending');
  }

  $('.pin-value').text('●●●●');
  $('.show-pin i').removeClass('fa-eye-slash');
  $('.show-pin i').addClass('fa-eye');


  let cardsArray = [];
  if (currentAccountType === 'business') {
    if (businessCardsData) {
      try {
        cardsArray = typeof businessCardsData === 'string' ? JSON.parse(businessCardsData) : businessCardsData;
        if (!Array.isArray(cardsArray)) {
          cardsArray = cardInfo ? [cardInfo] : [];
        }
      } catch (e) {
        cardsArray = cardInfo ? [cardInfo] : [];
      }
    } else {
      cardsArray = cardInfo ? [cardInfo] : [];
    }
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const accountIdentifier = currentAccountType.replace('custom_', '');
    if (customAccountCardsData && customAccountCardsData[accountIdentifier]) {
      cardsArray = customAccountCardsData[accountIdentifier];
    } else {
      cardsArray = cardInfo ? [cardInfo] : [];
    }
  } else {

    if (typeof playerData.playerPIN === 'string') {
      try {
        cardsArray = JSON.parse(playerData.playerPIN);
        if (!Array.isArray(cardsArray)) {
          cardsArray = cardInfo ? [cardInfo] : [];
        }
      } catch (e) {
        cardsArray = cardInfo ? [cardInfo] : [];
      }
    } else if (Array.isArray(playerData.playerPIN)) {
      cardsArray = playerData.playerPIN;
    } else {
      cardsArray = cardInfo ? [cardInfo] : [];
    }
  }


  const dotCount = Math.max(1, cardsArray.length);
  var dots = '';
  for (var i = 0; i < dotCount; i++) {
    if (i === 0) {
      dots += '<div class="dot dot-active" onclick="selectCard(this, ' + i + ')"></div>';
    } else {
      dots += '<div class="dot" onclick="selectCard(this, ' + i + ')"></div>';
    }
  }
  $('.card-dots').html(dots);
}


function resetCardHTMLToDefaults() {

  $('#cc-status').text(_L('ui_pending')).removeClass('active blocked pending').addClass('pending');
  $('.cc-number').text('●●●● ●●●● ●●●● ●●●●');
  $('.cc-holder-name').text(_L('ui_change_name'));
  $('.cc-exp-date').text('--/--');
  $('.card-status').text(_L('ui_pending')).removeClass('ci-active ci-blocked ci-pending').addClass('ci-pending');
  $('.pin-value').text(_L('ui_not_set'));
  $('.pin-value').removeClass('ci-pin');
  $('.card-daily-limit').text('0€');
  $('.card-limit-left').text('(0€)');
  $('.card-dots').html('<div class="dot dot-active"></div>');
  const cardButtonDailyLimit = document.getElementById('card-button-daily-limit');
  if (cardButtonDailyLimit) {
    cardButtonDailyLimit.disabled = true;
    cardButtonDailyLimit.style.opacity = 0;
    cardButtonDailyLimit.style.cursor = 'default';
    cardButtonDailyLimit.style.pointerEvents = 'none';
  }
  const manageCardButton = document.getElementById('manageCardButton');
  if (manageCardButton) {
    manageCardButton.disabled = true;
    manageCardButton.style.opacity = 0.5;
    manageCardButton.style.cursor = 'default';
    manageCardButton.style.pointerEvents = 'none';
  }
  const showPinButton = document.querySelector('.card-button.show-pin');
  if (showPinButton) {
    showPinButton.disabled = true;
    showPinButton.style.opacity = 0.5;
    showPinButton.style.cursor = 'default';
    showPinButton.style.pointerEvents = 'none';
  }
  const editPinButton = document.querySelector('.card-button.edit-pin');
  if (editPinButton) {
    editPinButton.disabled = true;
    editPinButton.style.opacity = 0.5;
    editPinButton.style.cursor = 'default';
    editPinButton.style.pointerEvents = 'none';
  }

  const createBtn = document.getElementById('createNewCardButton');
  if (createBtn && !isATMMode) {
    createBtn.disabled = false;
    createBtn.style.opacity = '1';
    createBtn.style.cursor = 'pointer';
    createBtn.style.color = '';
    createBtn.style.pointerEvents = 'auto';
    createBtn.classList.remove('disabled');

    const tooltipHandlers = createBtn._tooltipHandlers || {};
    if (tooltipHandlers.mouseenter) {
      createBtn.removeEventListener('mouseenter', tooltipHandlers.mouseenter);
      createBtn.removeEventListener('mouseleave', tooltipHandlers.mouseleave);
    }
    if (tooltipHandlers.click) {
      createBtn.removeEventListener('click', tooltipHandlers.click, true);
    }
    createBtn._tooltipHandlers = null;
  }
  selectedCardIndex = -1;
}


function updatePayAllButtonVisibility() {
  const payAllBtn = document.querySelector('.pay-all-bills');
  if (payAllBtn) {
    if (currentAccountType === 'business') {
      payAllBtn.style.display = 'none';
    } else {
      payAllBtn.style.display = '';
    }
  }
}

function setCardsInfo() {

  const previousCardIndex = selectedCardIndex;
  selectedCardIndex = -1;

  var cardsInfo = [];
  var cardHolderName = '';


  if (currentAccountType === 'personal') {

    if (!playerData.playerPIN) {
      resetCardHTMLToDefaults();
      return;
    }

    try {

      if (typeof playerData.playerPIN === 'string') {
        cardsInfo = JSON.parse(playerData.playerPIN);
      } else if (Array.isArray(playerData.playerPIN)) {
        cardsInfo = playerData.playerPIN;
      } else {
        resetCardHTMLToDefaults();
        return;
      }


      if (!cardsInfo || !Array.isArray(cardsInfo) || cardsInfo.length === 0) {
        cardsInfo = [];
        resetCardHTMLToDefaults();
        return;
      }
      cardHolderName = playerData.playerName;
    } catch (e) {
      console.error('[setCardsInfo] Personal: Error parsing PIN:', e);
      resetCardHTMLToDefaults();
      return;
    }
  } else if (currentAccountType === 'business') {

    if (businessCardsData === null) {
      resetCardHTMLToDefaults();
      loadBusinessCards();
      return;
    }
    if (typeof businessCardsData === 'string') {
      try {
        cardsInfo = JSON.parse(businessCardsData);
      } catch (e) {
        console.error('[setCardsInfo] Business: Error parsing businessCardsData:', e);
        cardsInfo = [];
      }
    } else {
      cardsInfo = businessCardsData || [];
    }
    cardHolderName = societyData?.society_name || '';


    if (cardsInfo.length === 0) {
      resetCardHTMLToDefaults();
      return;
    }
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {

    const accountIdentifier = currentAccountType.replace('custom_', '');
    const account = accounts[currentAccountType]?.accountData;

    if (!account) {
      resetCardHTMLToDefaults();
      return;
    }


    cardsInfo = customAccountCardsData[accountIdentifier] || [];
    cardHolderName = account.account_name || account.owner_name || '';


    if (!cardsInfo || !Array.isArray(cardsInfo)) {
      cardsInfo = [];
    }
    if (!cardsInfo || !Array.isArray(cardsInfo) || cardsInfo.length === 0) {
      resetCardHTMLToDefaults();
    }
  } else {

    resetCardHTMLToDefaults();
    return;
  }


  const totalCardsCount = cardsInfo.length;
  const activeCardsCount = cardsInfo.filter(card => card.status === 'active').length;

  const createBtn = document.getElementById('createNewCardButton');
  if (createBtn) {

    const tooltipHandlers = createBtn._tooltipHandlers || {};
    if (tooltipHandlers.mouseenter) {
      createBtn.removeEventListener('mouseenter', tooltipHandlers.mouseenter);
      createBtn.removeEventListener('mouseleave', tooltipHandlers.mouseleave);
    }
    if (tooltipHandlers.click) {
      createBtn.removeEventListener('click', tooltipHandlers.click, true);
    }


    const isMaxTotalCardsReached = cardsConfig.maxTotalCreditCards > 0 && totalCardsCount >= cardsConfig.maxTotalCreditCards;
    const isMaxActiveCardsReached = cardsConfig.maxCreditCards > 0 && activeCardsCount >= cardsConfig.maxCreditCards;
    const shouldDisable = isMaxTotalCardsReached || isMaxActiveCardsReached || isATMMode;

    if (shouldDisable) {
      createBtn.disabled = true;
      createBtn.style.opacity = '0.5';
      createBtn.style.cursor = 'default';
      createBtn.style.color = '#fff';
      createBtn.style.pointerEvents = 'auto';
      createBtn.classList.add('disabled');


      let tooltipMessage = 'You have reached the maximum number of cards';
      if (isMaxActiveCardsReached) {
        tooltipMessage = 'You have reached the maximum number of active cards';
      }


      tooltipHandlers.mouseenter = function () {
        showCustomTooltip(createBtn, tooltipMessage);
      };

      tooltipHandlers.mouseleave = function () {
        hideCustomTooltip();
      };


      tooltipHandlers.click = function (e) {
        e.preventDefault();
        e.stopPropagation();
        e.stopImmediatePropagation();
        return false;
      };


      createBtn._tooltipHandlers = tooltipHandlers;


      createBtn.addEventListener('mouseenter', tooltipHandlers.mouseenter);
      createBtn.addEventListener('mouseleave', tooltipHandlers.mouseleave);
      createBtn.addEventListener('click', tooltipHandlers.click, true);
    } else {

      if (isATMMode) {
        createBtn.disabled = true;
        createBtn.style.opacity = '0.5';
        createBtn.style.cursor = 'default';
        createBtn.style.color = '#fff';
        createBtn.style.pointerEvents = 'none';
        createBtn.classList.remove('disabled');
      } else {
        createBtn.disabled = false;
        createBtn.removeAttribute('style');
        createBtn.classList.remove('disabled');
      }


      if (tooltipHandlers.mouseenter) {
        createBtn.removeEventListener('mouseenter', tooltipHandlers.mouseenter);
        createBtn.removeEventListener('mouseleave', tooltipHandlers.mouseleave);
      }
      if (tooltipHandlers.click) {
        createBtn.removeEventListener('click', tooltipHandlers.click, true);
      }
      createBtn._tooltipHandlers = null;
    }
  }

  const cardButtonDailyLimit = document.getElementById('card-button-daily-limit');
  if (cardButtonDailyLimit) {

    if (cardsConfig.playerCanChangeDailyLimit && cardsInfo.length > 0 && !isATMMode) {
      cardButtonDailyLimit.disabled = false;
      cardButtonDailyLimit.style.opacity = '';
      cardButtonDailyLimit.style.cursor = '';
      cardButtonDailyLimit.style.pointerEvents = '';
    } else {
      cardButtonDailyLimit.disabled = true;
      cardButtonDailyLimit.style.opacity = 0;
      cardButtonDailyLimit.style.cursor = 'default';
      cardButtonDailyLimit.style.pointerEvents = 'none';
    }
  }


  const manageCardButton = document.getElementById('manageCardButton');
  const showPinButton = document.querySelector('.card-button.show-pin');
  const editPinButton = document.querySelector('.card-button.edit-pin');
  if (manageCardButton) {
    if (cardsInfo.length > 0 && !isATMMode) {

      manageCardButton.disabled = false;
      manageCardButton.style.opacity = '';
      manageCardButton.style.cursor = '';
      manageCardButton.style.pointerEvents = '';
      showPinButton.disabled = false;
      showPinButton.style.opacity = '';
      showPinButton.style.cursor = '';
      showPinButton.style.pointerEvents = '';
      editPinButton.disabled = false;
      editPinButton.style.opacity = '';
      editPinButton.style.cursor = '';
      editPinButton.style.pointerEvents = '';
    } else {

      manageCardButton.disabled = true;
      manageCardButton.style.opacity = 0.5;
      manageCardButton.style.cursor = 'default';
      manageCardButton.style.pointerEvents = 'none';
      showPinButton.disabled = true;
      showPinButton.style.opacity = 0.5;
      showPinButton.style.cursor = 'default';
      showPinButton.style.pointerEvents = 'none';
      editPinButton.disabled = true;
      editPinButton.style.opacity = 0.5;
      editPinButton.style.cursor = 'default';
      editPinButton.style.pointerEvents = 'none';
    }
  }


  const dotCount = Math.max(1, cardsInfo.length);
  var dots = '';
  for (var i = 0; i < dotCount; i++) {
    if (i === 0) {
      dots += '<div class="dot dot-active" onclick="selectCard(this, ' + i + ')"></div>';
    } else {
      dots += '<div class="dot" onclick="selectCard(this, ' + i + ')"></div>';
    }
  }
  $('.card-dots').html(dots);


  if (cardsInfo.length > 0) {

    selectCard($('.dot')[0], 0, previousCardIndex);
    $('.cc-holder-name').text(cardHolderName);
  }
}

function loadBusinessCards() {
  if (!societyData || !societyData.society) {
    businessCardsData = "[]";

    resetCardHTMLToDefaults();
    setCardsInfo();
    return;
  }

  fetch(`https://${GetParentResourceName()}/getBusinessCards`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({
      society: societyData.society
    })
  })
    .then(r => r.json())
    .then(data => {
      if (data.success && data.cards) {
        businessCardsData = data.cards;

        try {
          const cards = JSON.parse(data.cards);
          if (!cards || cards.length === 0) {

            resetCardHTMLToDefaults();
          }
        } catch (e) {

          resetCardHTMLToDefaults();
        }
      } else {
        businessCardsData = "[]";

        resetCardHTMLToDefaults();
      }
      setCardsInfo();
    })
    .catch(err => {
      businessCardsData = "[]";

      resetCardHTMLToDefaults();
      setCardsInfo();
    });
}

function selectCard(element, index, forcedPreviousIndex = null) {
  if (index !== selectedCardIndex) {

    const previousIndex = forcedPreviousIndex !== null ? forcedPreviousIndex : selectedCardIndex;
    const creditCardEl = document.querySelector('.credit-card');


    const updateCardInfo = () => {
      selectedCardIndex = index;

      const pinValueEl = document.querySelector('.pin-value');
      const iconEl = document.querySelector('.show-pin i');
      $('.pin-value').addClass('ci-pin');
      if (pinValueEl) pinValueEl.textContent = '●●●●';
      if (iconEl) iconEl.className = 'fa-solid fa-eye';


      var cardsInfo = [];
      if (currentAccountType === 'personal') {
        cardsInfo = JSON.parse(playerData.playerPIN);
      } else if (currentAccountType === 'business') {
        if (typeof businessCardsData === 'string') {
          try {
            cardsInfo = JSON.parse(businessCardsData);
          } catch (e) {
            cardsInfo = [];
          }
        } else {
          cardsInfo = businessCardsData || [];
        }
      } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
        const accountIdentifier = currentAccountType.replace('custom_', '');
        cardsInfo = customAccountCardsData[accountIdentifier] || [];
      }
      $('.dot').removeClass('dot-active');
      element.classList.add('dot-active');
      const cardNumber = cardsInfo[index].card_number.toString();
      const formattedCardNumber = cardNumber.replace(/(\d{4})(?=\d)/g, '$1 ');
      $('.cc-number').text(formattedCardNumber);
      $('.cc-exp-date').text(formatExpirationDate(cardsInfo[index].expiration_date));
      $('.card-daily-limit').text(formatCurrency(cardsInfo[index].daily_limit));
      $('.card-limit-left').text('(' + formatCurrency(cardsInfo[index].daily_limit - (cardsInfo[index].today_spent || 0)) + ')');

      if (cardsInfo[selectedCardIndex].status === 'active') {
        $('#cc-status').text(_L('ui_active'));
        $('#cc-status').removeClass('pending');
        $('#cc-status').removeClass('blocked');
        $('.card-status').text(_L('ui_active'));
        $('.card-status').removeClass('ci-pending');
        $('.card-status').removeClass('ci-blocked');
        $('#cc-status').addClass('active');
        $('.card-status').addClass('ci-active');
      } else if (cardsInfo[selectedCardIndex].status === 'blocked') {
        $('#cc-status').text(_L('ui_blocked'));
        $('#cc-status').removeClass('active');
        $('#cc-status').removeClass('pending');
        $('.card-status').text(_L('ui_blocked'));
        $('.card-status').removeClass('ci-active');
        $('.card-status').removeClass('ci-pending');
        $('#cc-status').addClass('blocked');
        $('.card-status').addClass('ci-blocked');
      } else if (cardsInfo[selectedCardIndex].status === 'pending') {
        $('#cc-status').text(_L('ui_pending'));
        $('#cc-status').removeClass('active');
        $('#cc-status').removeClass('blocked');
        $('.card-status').text(_L('ui_pending'));
        $('.card-status').removeClass('ci-active');
        $('.card-status').removeClass('ci-blocked');
        $('#cc-status').addClass('pending');
        $('.card-status').addClass('ci-pending');
      }
    };


    if (previousIndex >= 0 && previousIndex !== index && creditCardEl) {
      const isMovingForward = index > previousIndex;


      creditCardEl.classList.remove('slide-out-left', 'slide-out-right', 'slide-in-left', 'slide-in-right');


      if (isMovingForward) {
        creditCardEl.classList.add('slide-out-left');
      } else {
        creditCardEl.classList.add('slide-out-right');
      }


      setTimeout(() => {
        updateCardInfo();


        creditCardEl.classList.remove('slide-out-left', 'slide-out-right');
        if (isMovingForward) {
          creditCardEl.classList.add('slide-in-left');
        } else {
          creditCardEl.classList.add('slide-in-right');
        }


        setTimeout(() => {
          creditCardEl.classList.remove('slide-in-left', 'slide-in-right');
        }, CARD_SLIDE_ANIMATION_SPEED);
      }, CARD_SLIDE_ANIMATION_SPEED);
    } else {

      updateCardInfo();
    }
  }
}

function deleteCard() {
  openConfirmModal(_L('ui_delete_card_confirm'), _L('ui_delete_card'), 'red', function () {
    closeAllModals();
    var cardsInfo = getCurrentCards();
    if (cardsInfo.length === 0 || selectedCardIndex < 0 || selectedCardIndex >= cardsInfo.length) {
      return;
    }
    var currentCard = cardsInfo[selectedCardIndex];
    const cardNumberToDelete = (currentCard.card_number || '').replace(/\s+/g, '');
    const deletedCardIndex = selectedCardIndex;
    const url = `https://${GetParentResourceName()}/deleteCard`;

    $.post(url, JSON.stringify({
      cardInfo: currentCard,
      accountType: currentAccountType,
      cardOwner: (currentAccountType === 'business') ? societyData?.society : playerData?.playerCitizenId,
    }))
      .done(function (response) {
        if (response && response.success) {

          if (currentAccountType === 'personal') {

            if (typeof playerData.playerPIN === 'string') {
              try {
                var cards = JSON.parse(playerData.playerPIN);
                cards = cards.filter(function (card) {
                  const cardNum = (card.card_number || '').replace(/\s+/g, '');
                  return cardNum !== cardNumberToDelete;
                });
                playerData.playerPIN = JSON.stringify(cards);


                if (!cards || cards.length === 0) {
                  resetCardHTMLToDefaults();
                  return;
                }
              } catch (e) {
                console.error('Error updating personal cards:', e);
              }
            } else if (Array.isArray(playerData.playerPIN)) {
              playerData.playerPIN = playerData.playerPIN.filter(function (card) {
                const cardNum = (card.card_number || '').replace(/\s+/g, '');
                return cardNum !== cardNumberToDelete;
              });


              if (!playerData.playerPIN || playerData.playerPIN.length === 0) {
                resetCardHTMLToDefaults();
                return;
              }
            }
          } else if (currentAccountType === 'business') {

            loadBusinessCards();
            return;
          } else if (currentAccountType && currentAccountType.startsWith('custom_')) {

            const accountIdentifier = currentAccountType.replace('custom_', '');
            const cards = customAccountCardsData[accountIdentifier] || [];
            const updatedCards = cards.filter(function (card) {
              const cardNum = (card.card_number || '').replace(/\s+/g, '');
              return cardNum !== cardNumberToDelete;
            });

            customAccountCardsData[accountIdentifier] = updatedCards;


            if (!updatedCards || updatedCards.length === 0) {
              resetCardHTMLToDefaults();
              return;
            }
          }


          const newCardsCount = cardsInfo.length - 1;
          if (newCardsCount > 0) {
            if (deletedCardIndex >= newCardsCount) {
              selectedCardIndex = newCardsCount - 1;
            } else {
              selectedCardIndex = deletedCardIndex;
            }
          } else {
            selectedCardIndex = -1;
          }


          setCardsInfo();
        }
      });
  });
}

document.onkeyup = function (e) {
  if (e.which === 27 && isBankOpen && !isClosing) {
    closeBank();
  } else if (e.which === 27 && isReceiptOpen || e.which === 27 && isTransactionReceiptOpen) {
    closeReceipt();
  }
};


$(document).on('click', '.logout', function () {
  if (isBankOpen && !isClosing) {
    closeBank();
  }
});

$(document).on('click', '.pin-close-button', function () {
  closeBank();
});


function closeAllModals() {

  const allModals = document.querySelectorAll('.modal-div');

  allModals.forEach(modal => {

    const hasShowClass = modal.classList.contains('show');
    const style = modal.style.display;
    const isVisible = style === 'flex' || style === 'block' || hasShowClass;

    if (isVisible) {
      modal.classList.remove('show');
      setTimeout(() => {
        modal.style.display = 'none';
      }, 100);
    }
  });
}


let currentConfirmCallback = null;

function openConfirmModal(confirmText, buttonText, buttonColor, onConfirm) {
  const modal = document.getElementById('confirmCancelModal');
  if (!modal) return;


  const titleEl = modal.querySelector('.modal-t');
  if (titleEl) titleEl.textContent = _L('ui_are_you_sure');


  const cancelBtn = modal.querySelector('.btn-dark');
  if (cancelBtn) cancelBtn.textContent = _L('ui_cancel');

  const textEl = modal.querySelector('.modal-confirm-text');
  const btnEl = modal.querySelector('.btn-confirm');

  if (textEl) {
    textEl.innerHTML = confirmText;
  }

  if (btnEl) {
    btnEl.textContent = buttonText;

    btnEl.classList.remove('btn-blue', 'btn-red');

    if (buttonColor === 'red') {
      btnEl.classList.add('btn-red');
    } else {
      btnEl.classList.add('btn-blue');
    }
  }


  currentConfirmCallback = onConfirm;

  modal.style.display = 'flex';
  setTimeout(() => modal.classList.add('show'), 50);
}

function closeConfirmModal() {
  const modal = document.getElementById('confirmCancelModal');
  if (!modal) return;
  modal.classList.remove('show');
  setTimeout(() => {
    modal.style.display = 'none';
    currentConfirmCallback = null;
  }, 300);
}


$(document).on('click', '#confirmCancelModal .btn-confirm', function () {
  if (currentConfirmCallback && typeof currentConfirmCallback === 'function') {
    currentConfirmCallback();
  }
  closeConfirmModal();
});

$(document).on('click', '#confirmCancelModal .btn-dark', function () {
  closeConfirmModal();
});

$(document).on('click', '#closeConfirmCancelModal', function () {
  closeConfirmModal();
});

$(document).on('click', '#confirmCancelModal', function (e) {
  if (e.target === this) {
    closeConfirmModal();
  }
});

function closeBank() {
  if (isClosing || !isBankOpen) return;

  isClosing = true;

  cachedSavingsGoals = {};
  cachedActiveLoans = {};
  playedChartAnimations = {};
  lastRenderedSavingsAccount = null;

  closeAllModals();
  hideCustomTooltip();

  if (!onATMSelectAccount) {
    $('#menu').html(`
      <div class="loading-stack">
          <span class="load"></span>
          <div class="ldata-txt">${_L('ui_logging_out')}</div>
      </div>
    `);
    $("#menu").fadeIn();
    $(".main_card").fadeIn();
  }
  setTimeout(() => {
    $(".container").fadeOut();

    setTimeout(() => {
      $("#menu").fadeOut();
      $(".main_card").fadeOut();
      const url = `https://${GetParentResourceName()}/closeBank`;
      $.post(url, JSON.stringify({}));
      isClosing = false;
      isBankOpen = false;
      isInitialBankOpen = false;
      isATMMode = false;
      onATMSelectAccount = false;
    }, onATMSelectAccount ? 0 : 400);
  }, 300);
}

function closeReceipt() {
  isReceiptOpen = false;
  $('.receipt, .receipt-t').fadeOut();

  const url = `https://${GetParentResourceName()}/closeBank`;
  $.post(url, JSON.stringify({}));
}

function populateLastTransactions(transactions) {
  const container = document.querySelector('.ib-lt');
  if (!container) return;

  container.innerHTML = '';

  const txs = Array.isArray(transactions) ? transactions : [];
  if (!txs.length) {
    container.innerHTML = `
      <div class="lt-noinfo">
        <i class="fa-solid fa-receipt"></i>
        <div class="cni-ft">${_L('ui_no_transactions_yet')}</div>
        <div class="cni-lt">${_L('ui_transaction_history_help')}</div>
      </div>`;
    return;
  }

  txs.slice(0, 4).forEach(tx => {
    const sign = txSignForSelf(tx);
    const outgoing = sign < 0;
    const iconClass = outgoing ? 'outgoing' : 'incoming';
    const iconSymbol = outgoing ? 'fa-solid fa-arrow-down' : 'fa-solid fa-arrow-up';
    const valueClass = outgoing ? 'negative' : 'positive';
    const valuePref = outgoing ? '- ' : '+ ';
    const text = outgoing ? `${_L('ui_to')} ${tx.receiver_name}` : `${_L('ui_from')} ${tx.sender_name}`;
    const label = outgoing ? _L('ui_sent') : _L('ui_received');

    const el = document.createElement('div');
    el.className = 'last-transaction';
    el.innerHTML = `
      <div class="last-transaction-icon ${iconClass}"><i class="${iconSymbol}"></i></div>
      <div class="last-transaction-info">
        <div class="last-transaction-text">${limitCharacters(text, 16)}</div>
        <div class="last-transaction-label">${label}</div>
      </div>
      <div class="last-transaction-value ${valueClass}">${valuePref}${formatCurrency(tx.value)}</div>`;
    container.appendChild(el);
  });
}

function checkIfEmpty() {
  const depositAmount = +$("#deposit_money").val();
  const withdrawAmount = +$("#withdraw_money").val();


  const depositBtn = $("#deposit_btn");
  depositBtn.prop('disabled', !(depositAmount > 0));
  if (depositAmount > 0) {
    depositBtn.text(`${_L('ui_deposit')} ${formatCurrency(depositAmount)}`);
  } else {
    depositBtn.text(_L('ui_deposit'));
  }


  const withdrawBtn = $("#withdraw_btn");
  withdrawBtn.prop('disabled', !(withdrawAmount > 0));
  if (withdrawAmount > 0) {
    withdrawBtn.text(`${_L('ui_withdraw')} ${formatCurrency(withdrawAmount)}`);
  } else {
    withdrawBtn.text(_L('ui_withdraw'));
  }

  validateCardCreation();
  validateCreateAccount();
}

function checkTransferInfo() {

  const ibanGroup = document.getElementById('transfer_iban_group');
  const isIbanVisible = ibanGroup && ibanGroup.style.display !== 'none';

  let totalAmount = 0;
  let hasAmount = false;
  let transferBtnEnabled = false;


  if (currentTransferRecipientType === 'multiple') {

    const multipleContactsSection = document.getElementById('transfer_multiple_contacts_section');
    if (multipleContactsSection) {
      const amountInputs = multipleContactsSection.querySelectorAll('input[type="number"]');
      amountInputs.forEach(input => {
        const value = parseFloat(input.value) || 0;
        if (value > 0) {
          totalAmount += value;
        }
      });
    }
    hasAmount = totalAmount > 0;

    transferBtnEnabled = hasAmount && playerData.selectedContacts && Object.keys(playerData.selectedContacts).length > 0;
  } else {

    totalAmount = +$("#transfer_amount").val();
    hasAmount = totalAmount > 0;

    const requiresIban = currentTransferRecipientType !== 'savings' && isIbanVisible;
    const hasIban = requiresIban ? $('#transfer_iban').val().trim().length > 0 : true;
    transferBtnEnabled = hasAmount && hasIban;
  }

  const transferBtn = $("#transfer_btn");
  transferBtn.prop('disabled', !transferBtnEnabled);


  if (hasAmount) {
    transferBtn.text(`${_L('ui_transfer')} ${formatCurrency(totalAmount)}`);
  } else {
    transferBtn.text(_L('ui_transfer'));
  }
}

function validateCardCreation() {
  const pinValue = $("#createnewcard_pin").val().trim();
  const isPinValid = pinValue.length === 4 && /^\d{4}$/.test(pinValue);
  const isCardSelected = selectedCardType !== null;


  const shouldEnable = isCardSelected && isPinValid;
  const createBtn = document.getElementById('createnewcard_btn');
  createBtn.disabled = !shouldEnable;
  createBtn.style.opacity = shouldEnable ? '1' : '0.5';
  createBtn.style.cursor = shouldEnable ? 'pointer' : 'default';
}


$(document).on('input', '#createnewcard_pin', function () {

  this.value = this.value.replace(/[^0-9]/g, '');

  if (this.value.length > 4) {
    this.value = this.value.slice(0, 4);
  }

  validateCardCreation();
});


function ensureCardButtonDisabled() {
  const createBtn = document.getElementById('createnewcard_btn');
  createBtn.disabled = true;
  createBtn.style.opacity = '0.5';
  createBtn.style.cursor = 'default';
  selectedCardType = null;
  $('#createnewcard_pin').val('');
  $('.select-card-type .custom-select-text').text(_L('ui_select_card'));
}


$(window).on('load', function () {
  ensureCardButtonDisabled();
});

function validateCreateAccount() {
  const accountName = $("#create_account_name").val().trim();
  const hasAccountName = accountName.length > 0;
  const createBtn = document.getElementById('create_account_btn');

  if (createBtn) {
    createBtn.disabled = !hasAccountName;
    createBtn.style.opacity = hasAccountName ? '1' : '0.5';
    createBtn.style.cursor = hasAccountName ? 'pointer' : 'default';
  }
}

function openCreateAccount() {
  const createAccountFee = document.getElementById('create_account_fee');
  if (createAccountFee) {
    createAccountFee.textContent = formatCurrency(customAccountsConfig.CreationFee);
  }

  const modal = document.getElementById('createAccountModal');
  if (modal) {

    const titleEl = modal.querySelector('.modal-t');
    if (titleEl) titleEl.textContent = _L('ui_create_account');

    const accountNameLabel = modal.querySelector('.modal-option-title');
    if (accountNameLabel) accountNameLabel.textContent = _L('ui_account_name');

    const accountNameInput = modal.querySelector('#create_account_name');
    if (accountNameInput) accountNameInput.placeholder = _L('ui_account_name');

    const infoTitle = modal.querySelector('.alert-info .alert-title');
    if (infoTitle) infoTitle.textContent = _L('ui_information');

    const infoMessage = modal.querySelector('.alert-info .alert-message');
    if (infoMessage) {
      infoMessage.innerHTML = `${_L('ui_create_account_info')} <span class="bold" id="create_account_fee">${formatCurrency(customAccountsConfig.CreationFee)}</span>.`;
    }

    const createBtn = modal.querySelector('#create_account_btn');
    if (createBtn) createBtn.textContent = _L('ui_create_account');


    const dropdownMenu = document.getElementById('accountDropdownMenu');
    const arrow = document.querySelector('.dropdown-arrow');
    if (dropdownMenu) dropdownMenu.classList.remove('show');
    if (arrow) arrow.classList.remove('rotated');


    $('#create_account_name').val('');
    validateCreateAccount();


    modal.style.display = 'flex';
    setTimeout(() => {
      modal.classList.add('show');
    }, 10);
  }
}

function closeCreateAccountModal() {
  const modal = document.getElementById('createAccountModal');
  if (modal) {
    modal.classList.remove('show');
    setTimeout(() => {
      modal.style.display = 'none';
    }, 300);
  }
}


$(document).on('input', '#create_account_name', function () {
  const input = this;
  const cursorPos = input.selectionStart;
  const value = input.value;


  const capitalizedValue = value.replace(/\b\w/g, function (char) {
    return char.toUpperCase();
  });

  if (value !== capitalizedValue) {
    input.value = capitalizedValue;

    input.setSelectionRange(cursorPos, cursorPos);
  }

  validateCreateAccount();
});


$(document).on('click', '#closeCreateAccountModal, #createAccountModal', function (e) {

  if (e.target.id === 'createAccountModal' || e.target.id === 'closeCreateAccountModal' || e.target.closest('#closeCreateAccountModal')) {
    closeCreateAccountModal();
  }
});

function addCustomAccountToDropdown(account) {
  const dropdown = document.getElementById('accountDropdownMenu');
  if (!dropdown) return;


  const createNewOption = dropdown.querySelector('.create-new-option');
  if (!createNewOption) return;


  if (!customAccountsData.find(acc => acc.account_identifier === account.account_identifier)) {

    const fullAccount = {
      account_identifier: account.account_identifier,
      account_holder: account.account_holder || playerData?.playerCitizenId || '',
      owner_name: account.owner_name || account.account_name || '',
      account_name: account.account_name || account.owner_name || '',
      balance: toNumber(account.balance || 0),
      iban: account.iban || 'N/A',
      pincode: account.pincode || null,
      account_type: account.account_type || 'custom',
      is_owner: account.is_owner !== undefined ? account.is_owner : true,
      permissions: account.permissions || {
        deposit: true,
        withdraw: true,
        transfer: true,
        loans: true
      },
      transactions: Array.isArray(account.transactions) ? account.transactions : [],
      savings: account.savings || null,
      creditScore: account.creditScore || {
        score: 0,
        info: null
      },
      opening_date: account.opening_date || null,
      account_users: Array.isArray(account.account_users) ? account.account_users : []
    };
    customAccountsData.push(fullAccount);


    const accountKey = `custom_${account.account_identifier}`;
    accounts[accountKey] = {
      key: accountKey,
      name: () => fullAccount.account_name || fullAccount.owner_name || '',
      iban: () => fullAccount.iban || 'N/A',
      citizenId: () => fullAccount.account_holder,
      bankMoney: () => toNumber(fullAccount.balance || 0),
      walletMoney: () => toNumber(playerData?.playerWalletMoney || 0),
      transactions: () => fullAccount.transactions || [],
      preload: async () => { return fullAccount.transactions || []; },
      accountData: fullAccount
    };


    if (fullAccount.pincode) {
      try {
        const cards = typeof fullAccount.pincode === 'string' ? JSON.parse(fullAccount.pincode) : fullAccount.pincode;
        customAccountCardsData[account.account_identifier] = Array.isArray(cards) ? cards : [];
      } catch (e) {
        customAccountCardsData[account.account_identifier] = [];
      }
    } else {
      customAccountCardsData[account.account_identifier] = [];
    }
  } else {

    const existingIndex = customAccountsData.findIndex(acc => acc.account_identifier === account.account_identifier);
    if (existingIndex !== -1) {
      const existingAccount = customAccountsData[existingIndex];

      if (account.balance !== undefined) existingAccount.balance = toNumber(account.balance || 0);
      if (account.iban) existingAccount.iban = account.iban;
      if (account.pincode !== undefined) existingAccount.pincode = account.pincode;
      if (account.permissions) existingAccount.permissions = account.permissions;
      if (account.transactions) existingAccount.transactions = Array.isArray(account.transactions) ? account.transactions : [];
      if (account.savings !== undefined) existingAccount.savings = account.savings;
      if (account.creditScore) existingAccount.creditScore = account.creditScore;
      if (account.account_users) existingAccount.account_users = Array.isArray(account.account_users) ? account.account_users : [];


      const accountKey = `custom_${account.account_identifier}`;
      if (accounts[accountKey]) {
        accounts[accountKey].accountData = existingAccount;
      }
    }
  }


  const accountData = customAccountsData.find(acc => acc.account_identifier === account.account_identifier) || {
    account_identifier: account.account_identifier,
    account_name: account.account_name,
    is_owner: true
  };


  const accountOption = document.createElement('div');
  accountOption.className = 'account-option';
  accountOption.setAttribute('onclick', `selectAccount('custom_${account.account_identifier}')`);
  accountOption.setAttribute('data-account-identifier', account.account_identifier);

  const accountTypeText = accountData.is_owner ? _L('ui_owner') : _L('ui_user');

  accountOption.innerHTML = `
    <div class="account-info">
      <div class="account-name">${account.account_name}</div>
      <div class="account-type">${accountTypeText}</div>
    </div>
  `;


  const existingOption = dropdown.querySelector(`.account-option[data-account-identifier="${account.account_identifier}"]`);
  if (existingOption) {

    existingOption.innerHTML = accountOption.innerHTML;
    setTimeout(() => reorganizeAccountDropdown(), 50);
    return;
  }


  dropdown.insertBefore(accountOption, createNewOption);


  setTimeout(() => {
    reorganizeAccountDropdown();
  }, 150);
}

function createAccount() {
  const accountName = $("#create_account_name").val().trim();
  if (!accountName) return;

  fetch(`https://${GetParentResourceName()}/createAccount`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({ accountName })
  })
    .then(response => response.json())
    .then(data => {
      if (data.success && data.account) {

        if (data.bankBalance !== undefined) {
          playerData.playerBankMoney = data.bankBalance;

          if (currentAccountType === 'personal') {
            updatePlayerMoney(data.bankBalance);
          }
        }


        if (data.transactions && Array.isArray(data.transactions)) {
          const normalizedTxs = normalizeTransactionsPayload(data.transactions);


          if (currentAccountType === 'personal') {
            setActiveTransactions(normalizedTxs);


            if (currentPage === 'overview') {
              populateLastTransactions(normalizedTxs);
              populateBalanceChartFromTransactions(normalizedTxs);
            } else if (currentPage === 'transactions') {
              loadAllTransactions(normalizedTxs);
            }

            applyCurrentAccountToUI();
          }
        }


        closeCreateAccountModal();
        $('#create_account_name').val('');


        addCustomAccountToDropdown(data.account);


        const accountKey = `custom_${data.account.account_identifier}`;
        if (accounts[accountKey]) {

          selectAccount(accountKey);


          applyCurrentAccountToUI();


          if (currentPage === 'overview') {
            const account = accounts[accountKey];
            if (account && account.accountData) {
              const txs = normalizeTransactionsPayload(account.accountData.transactions || []);
              setActiveTransactions(txs);
              populateBalanceChartFromTransactions(txs);
              populateLastTransactions(txs);
            }
          }
        }
      }

    });
}


$(document).on('click', '#deposit_btn', function () {
  const amount = parseFloat($('#deposit_money').val());
  if (!(amount > 0)) return;

  const modal = document.getElementById('depositModal');

  modal.classList.remove('show');
  setTimeout(() => {
    modal.style.display = 'none';
    $('#deposit_money').val(''); $("#deposit_btn").prop('disabled', true).text(_L('ui_deposit'));
  }, 300);


  const isBusinessAccount = currentAccountType === 'business';
  const isCustomAccount = currentAccountType && currentAccountType.startsWith('custom_');


  let customAccountData = null;
  if (isCustomAccount) {
    const accountKey = currentAccountType;
    customAccountData = accounts[accountKey]?.accountData;
  }


  const cardOwner = isATMMode && isCustomAccount && customAccountData
    ? customAccountData.account_identifier
    : (isBusinessAccount ? (societyData?.society || playerData?.playerCitizenId)
      : (isATMMode && atmCardOwnerCitizenId ? atmCardOwnerCitizenId : playerData?.playerCitizenId));


  let effectiveOpenedAccount = openedAccount;
  if (currentAccountType === 'savings') {
    if (!openedAccount || (openedAccount !== 'personal' && openedAccount !== 'business' && !openedAccount.startsWith('custom_'))) {

      if (previousAccountType === 'business') {
        effectiveOpenedAccount = 'business';
      } else if (previousAccountType && previousAccountType.startsWith('custom_')) {
        effectiveOpenedAccount = previousAccountType;
      } else {
        effectiveOpenedAccount = 'personal';
      }
      openedAccount = effectiveOpenedAccount;
    }
  }


  const endpoint = isATMMode ? 'depositATM' : 'deposit';

  fetch(`https://${GetParentResourceName()}/${endpoint}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({
      amount,
      from: isBusinessAccount ? 'business' : (isCustomAccount ? 'custom' : currentAccountType),
      sourceKey: isBusinessAccount ? societyData?.society : (isCustomAccount ? customAccountData?.account_identifier : playerData?.playerCitizenId),
      sourceIban: isBusinessAccount ? societyData?.iban : (isCustomAccount ? customAccountData?.iban : playerData?.playerIBAN),
      accountType: isATMMode ? 'card' : currentAccountType,
      openedAccount: (currentAccountType === 'savings') ? effectiveOpenedAccount : undefined,
      cardInfo: isATMMode ? {
        cardInfo: playerData.playerPIN,
        cardOwner: cardOwner,
        cardHolder: playerData.playerCardHolder,
      } : null
    })
  })
    .then(r => r.json())
    .then(data => {
      if (!data.success) return;
      const payload = data.data;
      const txs = normalizeTransactionsPayload(payload.transactions);
      setActiveTransactions(txs);


      if (isATMMode && currentPage === 'overview' && currentAccountType === 'personal') {

        populateBalanceChartFromTransactions(playerTransactions);
        populateLastTransactions(playerTransactions);
      } else if (isATMMode && currentPage === 'overview' && currentAccountType === 'business') {

        populateBalanceChartFromTransactions(societyTransactions);
        populateLastTransactions(societyTransactions);
      } else if (currentAccountType === 'savings') {
        populateLastSavingsTransactions(txs);
        populateBalanceChartFromSavingsTransactions(txs);
        if (openedAccount === 'business' && societyData) {
          societyTransactions = txs;
        } else if (openedAccount && openedAccount.startsWith('custom_')) {
          const accountIdentifier = openedAccount.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            accounts["custom_" + accountIdentifier].accountData.transactions = Array.isArray(txs) ? txs : [];
            Object.entries(customAccountsData).forEach(([key, value]) => {
              if (value.account_identifier === accountIdentifier) {
                customAccountsData[key].transactions = Array.isArray(txs) ? txs : [];
              };
            });
          }
        } else {
          playerTransactions = txs;
        }
      }


      if (isBusinessAccount) {


        if (payload.playerBankMoney !== undefined) {
          if (societyData) {
            societyData.value = payload.playerBankMoney;
          }
          updatePlayerMoney(payload.playerBankMoney);
        }
      } else if (isCustomAccount && customAccountData) {

        if (payload.customAccountBalance !== undefined) {

          customAccountData.balance = payload.customAccountBalance;

          const accountKey = currentAccountType;
          if (accounts[accountKey]) {
            accounts[accountKey].accountData.balance = payload.customAccountBalance;
          }

          const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === customAccountData.account_identifier);
          if (accountIndex !== -1) {
            customAccountsData[accountIndex].balance = payload.customAccountBalance;
          }

          updatePlayerMoney(payload.customAccountBalance);
        }
      } else {

        if (payload.playerBankMoney !== undefined && currentAccountType !== 'savings') {

          if (isATMMode && atmCardOwnerCitizenId && atmCardOwnerCitizenId !== playerData.playerCitizenId) {
            atmCardOwnerBalance = payload.playerBankMoney;

            playerData.playerBankMoney = payload.playerBankMoney;
            updatePlayerMoney(payload.playerBankMoney);
          } else {
            updatePlayerMoney(payload.playerBankMoney);
          }
        } else if (payload.savings && payload.savings.balance !== undefined && currentAccountType === 'savings') {
          updatePlayerMoney(payload.savings.balance);

          if (openedAccount === 'business' && societyData) {
            societyData.savings = societyData.savings || {};
            societyData.savings.balance = payload.savings.balance;
          } else {
            playerData.savings = playerData.savings || {};
            playerData.savings.balance = payload.savings.balance;
          }
        }
      }

      if (payload.playerWalletMoney !== undefined) setWalletMoney(payload.playerWalletMoney);


      if (currentAccountType !== 'savings' && !isCustomAccount) {
        applyAccountPatches(payload.patches);
      } else if (isCustomAccount && payload.patches) {

        payload.patches.forEach(patch => {
          if (patch.key === customAccountData?.account_identifier) {
            customAccountData.balance = toNumber(patch.balance);
            const accountKey = currentAccountType;
            if (accounts[accountKey]) {
              accounts[accountKey].accountData.balance = toNumber(patch.balance);
            }
            const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === customAccountData.account_identifier);
            if (accountIndex !== -1) {
              customAccountsData[accountIndex].balance = toNumber(patch.balance);
            }
          }
        });

        applyCurrentAccountToUI();
      }


      if (!isBusinessAccount && !isCustomAccount && !isATMMode && payload.playerBankMoney !== undefined && currentAccountType !== 'savings') {
        updatePlayerMoney(payload.playerBankMoney);
      }


      if (isBusinessAccount && societyData && societyData.value !== undefined && currentAccountType !== 'savings') {
        updatePlayerMoney(societyData.value);
      }

      if (payload.receiver && payload.receiver.identifier) {
        const rid = String(payload.receiver.identifier);
        const rtx = normalizeTransactionsPayload(payload.receiver.transactions);
        if (societyData && rid === societyData.society) {
          societyTransactions = Array.isArray(rtx) ? rtx : [];
        } else if (playerData && rid === playerData.playerCitizenId) {
          playerTransactions = Array.isArray(rtx) ? rtx : [];
        } else if (openedAccount && openedAccount.startsWith('custom_')) {
          const accountIdentifier = openedAccount.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            customAccount.transactions = Array.isArray(rtx) ? rtx : [];
          }
        }
      }


      if (isATMMode && isBusinessAccount) {

        applyCurrentAccountToUI();
      }
    });
});

$(document).on('click', '#withdraw_btn', function () {
  const amount = parseFloat($('#withdraw_money').val());
  if (!(amount > 0)) return;

  const modal = document.getElementById('withdrawModal');

  modal.classList.remove('show');
  setTimeout(() => {
    modal.style.display = 'none';
    $('#withdraw_money').val(''); $("#withdraw_btn").prop('disabled', true).text(_L('ui_withdraw'));
  }, 300);


  const isBusinessAccount = currentAccountType === 'business';
  const isCustomAccount = currentAccountType && currentAccountType.startsWith('custom_');


  let customAccountData = null;
  if (isCustomAccount) {
    const accountKey = currentAccountType;
    customAccountData = accounts[accountKey]?.accountData;
  }


  const cardOwner = isATMMode && isCustomAccount && customAccountData
    ? customAccountData.account_identifier
    : (isBusinessAccount ? (societyData?.society || playerData?.playerCitizenId)
      : (isATMMode && atmCardOwnerCitizenId ? atmCardOwnerCitizenId : playerData?.playerCitizenId));


  let effectiveOpenedAccount = openedAccount;
  if (currentAccountType === 'savings') {
    if (!openedAccount || (openedAccount !== 'personal' && openedAccount !== 'business' && !openedAccount.startsWith('custom_'))) {

      if (previousAccountType === 'business') {
        effectiveOpenedAccount = 'business';
      } else if (previousAccountType && previousAccountType.startsWith('custom_')) {
        effectiveOpenedAccount = previousAccountType;
      } else {
        effectiveOpenedAccount = 'personal';
      }
      openedAccount = effectiveOpenedAccount;
    }
  }

  if (isBusinessAccount && isATMMode) {
    playerData.playerPIN = JSON.stringify(JSON.parse(businessCardsData)[0]);
  }


  const endpoint = isATMMode ? 'withdrawATM' : 'withdraw';
  fetch(`https://${GetParentResourceName()}/${endpoint}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({
      amount,
      from: isBusinessAccount ? 'business' : (isCustomAccount ? 'custom' : currentAccountType),
      sourceKey: isBusinessAccount ? societyData?.society : (isCustomAccount ? customAccountData?.account_identifier : playerData?.playerCitizenId),
      sourceIban: isBusinessAccount ? societyData?.iban : (isCustomAccount ? customAccountData?.iban : playerData?.playerIBAN),
      accountType: isATMMode ? 'card' : currentAccountType,
      openedAccount: (currentAccountType === 'savings') ? effectiveOpenedAccount : undefined,
      cardInfo: isATMMode ? {
        cardInfo: playerData.playerPIN,
        cardOwner: cardOwner,
        cardHolder: playerData.playerCardHolder,
      } : null
    })

  })
    .then(r => r.json())
    .then(data => {
      if (!data.success) return;
      const payload = data.data;
      const txs = normalizeTransactionsPayload(payload.transactions);
      setActiveTransactions(txs);


      if (isATMMode && currentPage === 'overview' && currentAccountType === 'personal') {

        populateBalanceChartFromTransactions(playerTransactions);
        populateLastTransactions(playerTransactions);
      } else if (isATMMode && currentPage === 'overview' && currentAccountType === 'business') {

        populateBalanceChartFromTransactions(societyTransactions);
        populateLastTransactions(societyTransactions);
      } else if (currentAccountType === 'savings') {
        populateLastSavingsTransactions(txs);
        populateBalanceChartFromSavingsTransactions(txs);
        if (openedAccount === 'business' && societyData) {
          societyTransactions = txs;
        } else if (openedAccount && openedAccount.startsWith('custom_')) {
          const accountIdentifier = openedAccount.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            accounts["custom_" + accountIdentifier].accountData.transactions = Array.isArray(txs) ? txs : [];
            Object.entries(customAccountsData).forEach(([key, value]) => {
              if (value.account_identifier === accountIdentifier) {
                customAccountsData[key].transactions = Array.isArray(txs) ? txs : [];
              };
            });
          }
        } else {
          playerTransactions = txs;
        }
      }


      if (isBusinessAccount) {

        if (payload.playerBankMoney !== undefined) {
          if (societyData) {
            societyData.value = payload.playerBankMoney;
          }
          updatePlayerMoney(payload.playerBankMoney);
        }
      } else if (isCustomAccount && customAccountData) {

        if (payload.customAccountBalance !== undefined) {

          customAccountData.balance = payload.customAccountBalance;

          const accountKey = currentAccountType;
          if (accounts[accountKey]) {
            accounts[accountKey].accountData.balance = payload.customAccountBalance;
          }

          const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === customAccountData.account_identifier);
          if (accountIndex !== -1) {
            customAccountsData[accountIndex].balance = payload.customAccountBalance;
          }

          updatePlayerMoney(payload.customAccountBalance);
        }
      } else {

        if (payload.playerBankMoney !== undefined && currentAccountType !== 'savings') {

          if (isATMMode && atmCardOwnerCitizenId && atmCardOwnerCitizenId !== playerData.playerCitizenId) {
            atmCardOwnerBalance = payload.playerBankMoney;

            playerData.playerBankMoney = payload.playerBankMoney;
            updatePlayerMoney(payload.playerBankMoney);

            loadATMCardInfo();
          } else {
            updatePlayerMoney(payload.playerBankMoney);
          }
        } else if (payload.savings && payload.savings.balance !== undefined && currentAccountType === 'savings') {
          updatePlayerMoney(payload.savings.balance);

          if (openedAccount === 'business' && societyData) {
            societyData.savings = societyData.savings || {};
            societyData.savings.balance = payload.savings.balance;
          } else {
            playerData.savings = playerData.savings || {};
            playerData.savings.balance = payload.savings.balance;
          }
        }
      }

      if (payload.playerWalletMoney !== undefined) setWalletMoney(payload.playerWalletMoney);


      if (currentAccountType !== 'savings' && !isCustomAccount) {
        applyAccountPatches(payload.patches);
      } else if (isCustomAccount && payload.patches) {

        payload.patches.forEach(patch => {
          if (patch.key === customAccountData?.account_identifier) {
            customAccountData.balance = toNumber(patch.balance);
            const accountKey = currentAccountType;
            if (accounts[accountKey]) {
              accounts[accountKey].accountData.balance = toNumber(patch.balance);
            }
            const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === customAccountData.account_identifier);
            if (accountIndex !== -1) {
              customAccountsData[accountIndex].balance = toNumber(patch.balance);
            }
          }
        });
        applyCurrentAccountToUI();
      }

      if (payload.receiver && payload.receiver.identifier) {
        const rid = String(payload.receiver.identifier);
        const rtx = normalizeTransactionsPayload(payload.receiver.transactions);
        if (societyData && rid === societyData.society) {
          societyTransactions = Array.isArray(rtx) ? rtx : [];
        } else if (playerData && rid === playerData.playerCitizenId) {
          playerTransactions = Array.isArray(rtx) ? rtx : [];
        }
      }


      if (isATMMode && payload.cardData) {

        const remaining = payload.cardData.daily_limit - payload.cardData.today_spent;
        $('.card-limit-left').text('(' + formatCurrency(remaining) + ')');


        if (isBusinessAccount && businessCardsData) {
          try {
            const cards = JSON.parse(businessCardsData);
            if (Array.isArray(cards)) {
              for (let i = 0; i < cards.length; i++) {
                const cardNum = (cards[i].card_number || '').replace(/\s+/g, '');
                const serverCardNum = (payload.cardData.card_number || '').replace(/\s+/g, '');
                if (cardNum === serverCardNum) {
                  cards[i].today_spent = payload.cardData.today_spent;
                  businessCardsData = JSON.stringify(cards);
                  break;
                }
              }
            }
          } catch (e) {
            console.error('Error updating business card data:', e);
          }
        } else if (playerData.playerPIN) {

          let cardData = null;
          if (typeof playerData.playerPIN === 'string') {
            try {
              cardData = JSON.parse(playerData.playerPIN);
            } catch (e) {
              cardData = playerData.playerPIN;
            }
          } else {
            cardData = playerData.playerPIN;
          }

          if (Array.isArray(cardData)) {
            for (let i = 0; i < cardData.length; i++) {
              const cardNum = (cardData[i].card_number || '').replace(/\s+/g, '');
              const serverCardNum = (payload.cardData.card_number || '').replace(/\s+/g, '');
              if (cardNum === serverCardNum) {
                cardData[i].today_spent = payload.cardData.today_spent;
                playerData.playerPIN = JSON.stringify(cardData);
                break;
              }
            }
          } else if (cardData && !Array.isArray(cardData)) {
            const cardNum = (cardData.card_number || '').replace(/\s+/g, '');
            const serverCardNum = (payload.cardData.card_number || '').replace(/\s+/g, '');
            if (cardNum === serverCardNum) {
              cardData.today_spent = payload.cardData.today_spent;
              playerData.playerPIN = JSON.stringify(cardData);
            }
          }
        }
      } else if (currentAccountType === 'card' && playerData.playerPIN) {


        let cardData = null;
        if (typeof playerData.playerPIN === 'string') {
          try {
            cardData = JSON.parse(playerData.playerPIN);
          } catch (e) {
            cardData = playerData.playerPIN;
          }
        } else {
          cardData = playerData.playerPIN;
        }

        if (Array.isArray(cardData) && selectedCardIndex >= 0) {
          const card = cardData[selectedCardIndex];
          if (card) {
            card.today_spent = (card.today_spent || 0) + amount;
            playerData.playerPIN = JSON.stringify(cardData);
            $('.card-limit-left').text('(' + formatCurrency(card.daily_limit - card.today_spent) + ')');
          }
        } else if (cardData && !Array.isArray(cardData)) {
          cardData.today_spent = (cardData.today_spent || 0) + amount;
          playerData.playerPIN = JSON.stringify(cardData);
          loadATMCardInfo();
        }
      }
    });
});

function transferMoney() {

  const amountAlt = $('#transfer_amount').val();
  const amountValue = amountAlt || '';
  const amount = parseFloat(amountValue);

  const ibanInput = document.getElementById('transfer_iban');
  const ibanGroup = document.getElementById('transfer_iban_group');
  const isIbanVisible = ibanGroup && ibanGroup.style.display !== 'none';
  const iban = isIbanVisible ? ($('#transfer_iban').val() || '') : '';


  const requiresIban = currentTransferRecipientType !== 'savings' && isIbanVisible;

  if ((isNaN(amount) || amount <= 0 || (requiresIban && !iban)) && currentTransferRecipientType !== 'multiple') {
    return;
  } else if (currentTransferRecipientType === 'multiple') {
    Object.entries(playerData.selectedContacts).forEach(([iban, contact]) => {
      const amountInput = document.getElementById(`transfer_amount_${iban}`);
      if (amountInput) {
        playerData.selectedContacts[iban].amount = amountInput.value;
      }
    });
  }

  const modal = document.getElementById('transferModal');

  modal.classList.remove('show');
  setTimeout(() => {
    modal.style.display = 'none';
    $('#transfer_iban').val('');
    $('#transfer_amount').val('');
  }, 300);


  const isBusinessAccount = currentAccountType === 'business';
  const isCustomAccount = currentAccountType && currentAccountType.startsWith('custom_');


  let customAccountData = null;
  if (isCustomAccount) {
    const accountKey = currentAccountType;
    customAccountData = accounts[accountKey]?.accountData;
  }


  const cardOwner = isATMMode && isCustomAccount && customAccountData
    ? customAccountData.account_identifier
    : (isBusinessAccount ? (societyData?.society || playerData?.playerCitizenId)
      : (isATMMode && atmCardOwnerCitizenId ? atmCardOwnerCitizenId : playerData?.playerCitizenId));


  let effectiveOpenedAccount = openedAccount;
  if (currentAccountType === 'savings') {
    if (!openedAccount || (openedAccount !== 'personal' && openedAccount !== 'business' && !openedAccount.startsWith('custom_'))) {

      if (previousAccountType === 'business') {
        effectiveOpenedAccount = 'business';
      } else if (previousAccountType && previousAccountType.startsWith('custom_')) {
        effectiveOpenedAccount = previousAccountType;
      } else {
        effectiveOpenedAccount = 'personal';
      }
      openedAccount = effectiveOpenedAccount;
    }
  }

  if (isBusinessAccount && isATMMode) {
    playerData.playerPIN = JSON.stringify(JSON.parse(businessCardsData)[0]);
  }

  if (currentTransferRecipientType === 'savings') {
    const endpoint = 'transferToSavings';


    const savingsOpenedAccount = isBusinessAccount ? 'business'
      : (isCustomAccount ? currentAccountType : (openedAccount || 'personal'));

    fetch(`https://${GetParentResourceName()}/${endpoint}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({
        amount,
        openedAccount: savingsOpenedAccount,
        isATMMode: isATMMode,
        cardInfo: isATMMode ? {
          cardInfo: playerData.playerPIN,
          cardOwner: cardOwner,
          cardHolder: playerData.playerCardHolder,
        } : null
      })
    })
      .then(r => r.json())
      .then(data => {
        if (!data.success) return;
        const payload = data.data;
        const txs = normalizeTransactionsPayload(payload.transactions);
        setActiveTransactions(txs);


        if (isATMMode && currentPage === 'overview' && currentAccountType === 'personal') {
          populateBalanceChartFromTransactions(playerTransactions);
          populateLastTransactions(playerTransactions);
        } else if (isATMMode && currentPage === 'overview' && currentAccountType === 'business') {

          populateBalanceChartFromTransactions(societyTransactions);
          populateLastTransactions(societyTransactions);
        } else if (isATMMode && currentPage === 'overview' && isCustomAccount) {

          const accountKey = currentAccountType;
          const customTxs = accounts[accountKey]?.accountData?.transactions || txs;
          populateBalanceChartFromTransactions(customTxs);
          populateLastTransactions(customTxs);
        }


        if (isBusinessAccount) {

          if (payload.playerBankMoney !== undefined) {
            if (societyData) {
              societyData.value = payload.playerBankMoney;
            }
            updatePlayerMoney(payload.playerBankMoney);
          }
        } else if (isCustomAccount && customAccountData) {

          if (payload.customAccountBalance !== undefined) {

            customAccountData.balance = payload.customAccountBalance;

            const accountKey = currentAccountType;
            if (accounts[accountKey]) {
              accounts[accountKey].accountData.balance = payload.customAccountBalance;
              accounts[accountKey].accountData.transactions = payload.transactions;
            }

            const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === customAccountData.account_identifier);
            if (accountIndex !== -1) {
              customAccountsData[accountIndex].balance = payload.customAccountBalance;
              customAccountsData[accountIndex].transactions = payload.transactions;
            }

            updatePlayerMoney(payload.customAccountBalance);
          }

        } else {

          if (payload.playerBankMoney !== undefined && currentAccountType !== 'savings') {
            updatePlayerMoney(payload.playerBankMoney);
          } else if (payload.savings && payload.savings.balance !== undefined && currentAccountType === 'savings') {
            updatePlayerMoney(payload.savings.balance);

            if (openedAccount === 'business' && societyData) {
              societyData.savings = societyData.savings || {};
              societyData.savings.balance = payload.savings.balance;
            } else {
              playerData.savings = playerData.savings || {};
              playerData.savings.balance = payload.savings.balance;
            }
          }
        }

        applyAccountPatches(payload.patches);


        if (isCustomAccount) {
          applyCurrentAccountToUI();
        }


        if (isATMMode && payload.cardData && playerData.playerPIN) {

          let cardData = null;
          if (typeof playerData.playerPIN === 'string') {
            try {
              cardData = JSON.parse(playerData.playerPIN);
            } catch (e) {
              cardData = playerData.playerPIN;
            }
          } else {
            cardData = playerData.playerPIN;
          }

          if (Array.isArray(cardData) && selectedCardIndex >= 0) {
            const card = cardData[selectedCardIndex];
            if (card) {
              card.today_spent = payload.cardData.today_spent;
              playerData.playerPIN = JSON.stringify(cardData);
              $('.card-limit-left').text('(' + formatCurrency(card.daily_limit - card.today_spent) + ')');
            }
          } else if (cardData && !Array.isArray(cardData)) {
            cardData.today_spent = payload.cardData.today_spent;
            playerData.playerPIN = JSON.stringify(cardData);
            loadATMCardInfo();
          }
        }
      });

  } else if (currentTransferRecipientType === 'multiple') {

    const multiTransferOpenedAccount = isBusinessAccount ? 'business'
      : (isCustomAccount ? currentAccountType : (openedAccount || 'personal'));

    fetch(`https://${GetParentResourceName()}/transferToMultipleContacts`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({
        accounts: playerData.selectedContacts,
        openedAccount: multiTransferOpenedAccount,
        accountType: isATMMode ? 'card' : currentAccountType,
        from: isBusinessAccount ? 'business' : (isCustomAccount ? 'custom' : currentAccountType),
        sourceKey: isBusinessAccount ? societyData?.society : (isCustomAccount ? customAccountData?.account_identifier : playerData?.playerCitizenId),
        sourceIban: isBusinessAccount ? societyData?.iban : (isCustomAccount ? customAccountData?.iban : playerData?.playerIBAN),
        cardInfo: isATMMode ? {
          cardInfo: playerData.playerPIN,
          cardOwner: cardOwner,
          cardHolder: playerData.playerCardHolder,
        } : null
      })
    })
      .then(r => r.json())
      .then(data => {
        if (!data.success) return;
        const payload = data.data;


        const senderTxs = normalizeTransactionsPayload(payload.transactions);
        setActiveTransactions(senderTxs);


        if (isATMMode && currentPage === 'overview' && currentAccountType === 'personal') {
          populateBalanceChartFromTransactions(playerTransactions);
          populateLastTransactions(playerTransactions);
        } else if (isATMMode && currentPage === 'overview' && currentAccountType === 'business') {

          populateBalanceChartFromTransactions(societyTransactions);
          populateLastTransactions(societyTransactions);
        } else if (isATMMode && currentPage === 'overview' && isCustomAccount) {

          const accountKey = currentAccountType;
          const customTxs = accounts[accountKey]?.accountData?.transactions || senderTxs;
          populateBalanceChartFromTransactions(customTxs);
          populateLastTransactions(customTxs);
        }


        if (currentAccountType === 'savings') {
          populateLastSavingsTransactions(senderTxs);
          populateBalanceChartFromSavingsTransactions(senderTxs);
          if (openedAccount === 'business' && societyData) {
            societyTransactions = senderTxs;
          } else if (openedAccount && openedAccount.startsWith('custom_')) {
            const accountIdentifier = openedAccount.replace('custom_', '');
            const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
            if (customAccount) {
              accounts["custom_" + accountIdentifier].accountData.transactions = Array.isArray(senderTxs) ? senderTxs : [];
              Object.entries(customAccountsData).forEach(([key, value]) => {
                if (value.account_identifier === accountIdentifier) {
                  customAccountsData[key].transactions = Array.isArray(senderTxs) ? senderTxs : [];
                };
              });
            }
          } else {
            playerTransactions = senderTxs;
          }
        }


        if (currentAccountType === 'savings') {

          if (payload.savings && payload.savings.balance !== undefined) {
            updatePlayerMoney(payload.savings.balance);

            if (openedAccount === 'business' && societyData) {
              societyData.savings = societyData.savings || {};
              societyData.savings.balance = payload.savings.balance;
            } else if (openedAccount && openedAccount.startsWith('custom_')) {
              const accountIdentifier = openedAccount.replace('custom_', '');
              const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
              if (customAccount) {
                customAccount.savings = customAccount.savings || {};
                customAccount.savings.balance = payload.savings.balance;
              }
            } else {
              playerData.savings = playerData.savings || {};
              playerData.savings.balance = payload.savings.balance;
            }
          }
        } else {

          if (payload.patches && payload.patches.currentAccountBalance !== undefined) {
            updatePlayerMoney(payload.patches.currentAccountBalance);
          }
        }


        if (payload.patches && payload.patches.accounts !== undefined) {
          applyMultipleContactsAccountPatches(payload.patches.accounts);
        }


        applyCurrentAccountToUI();


        if (currentPage === 'transactions') {
          loadAllTransactions(getActiveTransactions());
        }


        if (isATMMode && payload.cardData && playerData.playerPIN) {

          let cardData = null;
          if (typeof playerData.playerPIN === 'string') {
            try {
              cardData = JSON.parse(playerData.playerPIN);
            } catch (e) {
              cardData = playerData.playerPIN;
            }
          } else {
            cardData = playerData.playerPIN;
          }

          if (Array.isArray(cardData) && selectedCardIndex >= 0) {
            const card = cardData[selectedCardIndex];
            if (card) {
              card.today_spent = payload.cardData.today_spent;
              playerData.playerPIN = JSON.stringify(cardData);
              $('.card-limit-left').text('(' + formatCurrency(card.daily_limit - card.today_spent) + ')');
            }
          } else if (cardData && !Array.isArray(cardData)) {
            cardData.today_spent = payload.cardData.today_spent;
            playerData.playerPIN = JSON.stringify(cardData);
            loadATMCardInfo();
          }
        }
      });

  } else {
    const endpoint = isATMMode ? 'transferATM' : 'transfer';
    fetch(`https://${GetParentResourceName()}/${endpoint}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({
        amount, iban,
        from: isBusinessAccount ? 'business' : (isCustomAccount ? 'custom' : currentAccountType),
        sourceKey: isBusinessAccount ? societyData?.society : (isCustomAccount ? customAccountData?.account_identifier : playerData?.playerCitizenId),
        accountType: isATMMode ? 'card' : currentAccountType,
        openedAccount: (currentAccountType === 'savings') ? effectiveOpenedAccount : undefined,
        cardInfo: isATMMode ? {
          cardInfo: playerData.playerPIN,
          cardOwner: cardOwner,
          cardHolder: playerData.playerCardHolder,
        } : null
      })

    })
      .then(r => r.json())
      .then(data => {
        if (!data.success) return;
        const payload = data.data;
        const txs = normalizeTransactionsPayload(payload.transactions);
        setActiveTransactions(txs);


        if (isATMMode && currentPage === 'overview' && currentAccountType === 'personal') {

          populateBalanceChartFromTransactions(playerTransactions);
          populateLastTransactions(playerTransactions);
        } else if (isATMMode && currentPage === 'overview' && currentAccountType === 'business') {

          populateBalanceChartFromTransactions(societyTransactions);
          populateLastTransactions(societyTransactions);
        } else if (currentAccountType === 'savings') {
          populateLastSavingsTransactions(txs);
          populateBalanceChartFromSavingsTransactions(txs);
          if (openedAccount === 'business' && societyData) {
            societyTransactions = txs;
          } else if (openedAccount && openedAccount.startsWith('custom_')) {
            const accountIdentifier = openedAccount.replace('custom_', '');
            const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
            if (customAccount) {
              accounts["custom_" + accountIdentifier].accountData.transactions = Array.isArray(txs) ? txs : [];
              Object.entries(customAccountsData).forEach(([key, value]) => {
                if (value.account_identifier === accountIdentifier) {
                  customAccountsData[key].transactions = Array.isArray(txs) ? txs : [];
                };
              });
            }
          } else {
            playerTransactions = txs;
          }
        }


        if (isBusinessAccount) {

          if (payload.playerBankMoney !== undefined) {
            if (societyData) {
              societyData.value = payload.playerBankMoney;
            }
            updatePlayerMoney(payload.playerBankMoney);
          }
        } else if (isCustomAccount && customAccountData) {

          if (payload.customAccountBalance !== undefined) {

            customAccountData.balance = payload.customAccountBalance;

            const accountKey = currentAccountType;
            if (accounts[accountKey]) {
              accounts[accountKey].accountData.balance = payload.customAccountBalance;
            }

            const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === customAccountData.account_identifier);
            if (accountIndex !== -1) {
              customAccountsData[accountIndex].balance = payload.customAccountBalance;
            }

            updatePlayerMoney(payload.customAccountBalance);
          }

        } else {

          if (payload.playerBankMoney !== undefined && currentAccountType !== 'savings') {
            updatePlayerMoney(payload.playerBankMoney);
          } else if (payload.savings && payload.savings.balance !== undefined && currentAccountType === 'savings') {
            updatePlayerMoney(payload.savings.balance);

            if (openedAccount === 'business' && societyData) {
              societyData.savings = societyData.savings || {};
              societyData.savings.balance = payload.savings.balance;
            } else {
              playerData.savings = playerData.savings || {};
              playerData.savings.balance = payload.savings.balance;
            }
          }
        }

        if (payload.playerWalletMoney !== undefined) setWalletMoney(payload.playerWalletMoney);


        if (payload.patches) {
          payload.patches.forEach(patch => {

            if (patch.key && typeof patch.key === 'string') {

              const customAccount = customAccountsData.find(acc => acc.account_identifier === patch.key);
              if (customAccount) {

                customAccount.balance = toNumber(patch.balance);

                const accountKey = `custom_${patch.key}`;
                if (accounts[accountKey]) {
                  accounts[accountKey].accountData.balance = toNumber(patch.balance);
                }
              }
            }
          });
        }
        applyAccountPatches(payload.patches);

        if (payload.receiver && payload.receiver.identifier) {
          const rid = String(payload.receiver.identifier);
          const rtx = normalizeTransactionsPayload(payload.receiver.transactions);
          if (societyData && rid === societyData.society) {
            societyTransactions = Array.isArray(rtx) ? rtx : [];
          } else if (playerData && rid === playerData.playerCitizenId) {
            playerTransactions = Array.isArray(rtx) ? rtx : [];
          } else if (payload.receiver.isCustomAccount) {

            const customAccount = customAccountsData.find(acc => acc.account_identifier === rid);
            if (customAccount) {
              customAccount.transactions = Array.isArray(rtx) ? rtx : [];

              const accountKey = `custom_${rid}`;
              if (accounts[accountKey] && accounts[accountKey].accountData) {
                accounts[accountKey].accountData.transactions = Array.isArray(rtx) ? rtx : [];
              }
            }
          }
        }


        if (isCustomAccount) {
          applyCurrentAccountToUI();
        }


        if (isATMMode && payload.cardData) {

          const remaining = payload.cardData.daily_limit - payload.cardData.today_spent;
          $('.card-limit-left').text('(' + formatCurrency(remaining) + ')');


          if (isBusinessAccount && businessCardsData) {
            try {
              const cards = JSON.parse(businessCardsData);
              if (Array.isArray(cards)) {
                for (let i = 0; i < cards.length; i++) {
                  const cardNum = (cards[i].card_number || '').replace(/\s+/g, '');
                  const serverCardNum = (payload.cardData.card_number || '').replace(/\s+/g, '');
                  if (cardNum === serverCardNum) {
                    cards[i].today_spent = payload.cardData.today_spent;
                    businessCardsData = JSON.stringify(cards);
                    break;
                  }
                }
              }
            } catch (e) {
              console.error('Error updating business card data:', e);
            }
          } else if (playerData.playerPIN) {

            let cardData = null;
            if (typeof playerData.playerPIN === 'string') {
              try {
                cardData = JSON.parse(playerData.playerPIN);
              } catch (e) {
                cardData = playerData.playerPIN;
              }
            } else {
              cardData = playerData.playerPIN;
            }

            if (Array.isArray(cardData)) {
              for (let i = 0; i < cardData.length; i++) {
                const cardNum = (cardData[i].card_number || '').replace(/\s+/g, '');
                const serverCardNum = (payload.cardData.card_number || '').replace(/\s+/g, '');
                if (cardNum === serverCardNum) {
                  cardData[i].today_spent = payload.cardData.today_spent;
                  playerData.playerPIN = JSON.stringify(cardData);
                  break;
                }
              }
            } else if (cardData && !Array.isArray(cardData)) {
              const cardNum = (cardData.card_number || '').replace(/\s+/g, '');
              const serverCardNum = (payload.cardData.card_number || '').replace(/\s+/g, '');
              if (cardNum === serverCardNum) {
                cardData.today_spent = payload.cardData.today_spent;
                playerData.playerPIN = JSON.stringify(cardData);
              }
            }
          }
        } else if (currentAccountType === 'card' && playerData.playerPIN) {


          let cardData = null;
          if (typeof playerData.playerPIN === 'string') {
            try {
              cardData = JSON.parse(playerData.playerPIN);
            } catch (e) {
              cardData = playerData.playerPIN;
            }
          } else {
            cardData = playerData.playerPIN;
          }

          if (Array.isArray(cardData) && selectedCardIndex >= 0) {
            const card = cardData[selectedCardIndex];
            if (card) {
              card.today_spent = (card.today_spent || 0) + amount;
              playerData.playerPIN = JSON.stringify(cardData);
              $('.card-limit-left').text('(' + formatCurrency(card.daily_limit - card.today_spent) + ')');
            }
          } else if (cardData && !Array.isArray(cardData)) {
            cardData.today_spent = (cardData.today_spent || 0) + amount;
            playerData.playerPIN = JSON.stringify(cardData);
            loadATMCardInfo();
          }
        }

      });
  }
};

function applyMultipleContactsAccountPatches(patches) {
  if (Array.isArray(patches)) {
    patches.forEach(p => {

      if (p.key && p.key === playerData.playerCitizenId) {
        playerData.playerBankMoney = toNumber(p.amount);
        if (p.transactions) {
          playerTransactions = normalizeTransactionsPayload(p.transactions);
        }
      }

      if (societyData && p.key && p.key === societyData.society) {
        societyData.value = toNumber(p.amount);
        if (p.transactions) {
          societyTransactions = normalizeTransactionsPayload(p.transactions);
        }
      }

      const customAccountKey = "custom_" + p.key;
      if (accounts[customAccountKey]) {
        accounts[customAccountKey].accountData.balance = toNumber(p.amount);
        if (p.transactions) {
          accounts[customAccountKey].accountData.transactions = normalizeTransactionsPayload(p.transactions);

          const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === p.key);
          if (accountIndex !== -1) {
            customAccountsData[accountIndex].transactions = normalizeTransactionsPayload(p.transactions);
          }
        }
      }
    });
  }
}


$(document).on('click', '#closeWithdrawModal', function () {
  const m = document.getElementById('withdrawModal');
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; $('#withdraw_money').val(''); $("#withdraw_btn").prop('disabled', true).text(_L('ui_withdraw')); }, 300);
});
$(document).on('click', '#withdrawModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; $('#withdraw_money').val(''); $("#withdraw_btn").prop('disabled', true).text(_L('ui_withdraw')); }, 300);
});
$(document).on('click', '#closeDepositModal', function () {
  const m = document.getElementById('depositModal');
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; $('#deposit_money').val(''); $("#deposit_btn").prop('disabled', true).text(_L('ui_deposit')); }, 300);
});
$(document).on('click', '#depositModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; $('#deposit_money').val(''); $("#deposit_btn").prop('disabled', true).text(_L('ui_deposit')); }, 300);
});
$(document).on('click', '#closeTransferModal', function () {
  const m = document.getElementById('transferModal');
  m.classList.remove('show');
  setTimeout(() => {
    m.style.display = 'none';
    $('#transfer_amount').val('');
    $('#transfer_iban').val('');
    $("#transfer_btn").prop('disabled', true).text(_L('ui_transfer'));

    initializeTransferModal();
  }, 300);
});
$(document).on('click', '#transferModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => {
    m.style.display = 'none';
    $('#transfer_amount').val('');
    $('#transfer_iban').val('');
    $("#transfer_btn").prop('disabled', true).text(_L('ui_transfer'));

    initializeTransferModal();
  }, 300);
});

$(document).on('click', '#closeNewCardModal', function () {
  const m = document.getElementById('createNewCardModal');
  m.classList.remove('show');
  setTimeout(() => {
    m.style.display = 'none';

    ensureCardButtonDisabled();
    validateCardCreation();
  }, 300);
});
$(document).on('click', '#createNewCardModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => {
    m.style.display = 'none';

    ensureCardButtonDisabled();
    validateCardCreation();
  }, 300);
});

$(document).on('click', '#closeManageCardModal', function () {
  const m = document.getElementById('manageCardModal');
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});
$(document).on('click', '#manageCardModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});

$(document).on('click', '#closeAccountUsersModal', function () {
  const m = document.getElementById('accountUsersModal');
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});
$(document).on('click', '#accountUsersModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});

$(document).on('click', '#closeCreditScoreModal', function () {
  const m = document.getElementById('creditScoreModal');
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});
$(document).on('click', '#creditScoreModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});

$(document).on('click', '#closeAccountSettingsModal', function () {
  const m = document.getElementById('accountSettingsModal');
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});
$(document).on('click', '#accountSettingsModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});

$(document).on('click', '#closeManageLoanModal', function () {
  const m = document.getElementById('manageLoanModal');
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});
$(document).on('click', '#manageLoanModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
});

$(document).on('click', '#closeManageGoalModal', function () {
  const m = document.getElementById('manageGoalModal');
  m.classList.remove('show');
  setTimeout(() => {
    m.style.display = 'none';

    const inputEl = document.getElementById('addToGoalAmount');
    if (inputEl) inputEl.value = '';
  }, 300);
});
$(document).on('click', '#manageGoalModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => {
    m.style.display = 'none';

    const inputEl = document.getElementById('addToGoalAmount');
    if (inputEl) inputEl.value = '';
  }, 300);
});


function openMultipleContactsModal() {
  const contactsList = document.getElementById('multipleContactsList');
  const newContactName = document.getElementById('newContactName');
  const newContactIban = document.getElementById('newContactIban');
  const newContactSave = document.getElementById('newContactSave');
  const addNewContact = document.getElementById('addNewContact');
  const contactsFavoritesCount = document.getElementById('contactsFavoritesCount');
  const contactsFavoritesList = document.getElementById('contactsFavoritesList');


  const modalTitle = document.getElementById('multiple_contacts_title');
  if (modalTitle) modalTitle.textContent = _L('ui_multiple_contacts');

  const searchInput = document.getElementById('multipleContactsSearch');
  if (searchInput) {
    searchInput.placeholder = _L('ui_search');

    searchInput.value = '';
    __contactsFilter = null;

    if (!searchInput.dataset.bound) {
      searchInput.addEventListener('input', (e) => {
        filterContacts(e.target.value);
      });
      searchInput.dataset.bound = '1';
    }
  }


  const nameLabel = document.querySelector('#newContactName .modal-option-title');
  if (nameLabel) nameLabel.textContent = _L('ui_name');


  const ibanLabel = document.querySelector('#newContactIban .modal-option-title');
  if (ibanLabel) ibanLabel.textContent = _L('ui_iban');

  const saveButton = document.getElementById('saveContactBtn');
  if (saveButton) {
    saveButton.textContent = _L('ui_save_contact');
    saveButton.disabled = true;
    saveButton.style.opacity = '0.5';
    saveButton.style.cursor = 'default';
  }


  if (newContactName && newContactIban && newContactSave) {
    newContactName.style.display = 'none';
    newContactIban.style.display = 'none';
    newContactSave.style.display = 'none';
  }


  if (addNewContact) {
    addNewContact.textContent = _L('ui_add_new');
    addNewContact.classList.remove('contacts-cancel', 'contacts-new-blocked');
    addNewContact.classList.add('contacts-new');
  }


  if (!playerData.bankContacts) {
    playerData.bankContacts = {};
  }

  if (Object.keys(playerData.bankContacts).length === 0) {
    if (addNewContact) {
      addNewContact.classList.remove('contacts-new-blocked');
      addNewContact.classList.add('contacts-new');
    }

    contactsFavoritesCount.innerHTML = _L('ui_favorites') + ' (0/3)';
  }

  updateMultipleContactsModal();

  const modal = document.getElementById('multipleContactsModal');
  if (modal) {
    modal.style.display = 'flex';
    setTimeout(() => modal.classList.add('show'), 50);
  }
}

function closeMultipleContactsModal(keepOpen) {
  const modal = document.getElementById('multipleContactsModal');
  if (!modal) return;

  modal.classList.remove('show');
  setTimeout(() => {
    modal.style.display = 'none';


    const searchInput = document.getElementById('multipleContactsSearch');
    if (searchInput) {
      searchInput.value = '';
    }
    __contactsFilter = null;


    const newContactName = document.getElementById('newContactName');
    const newContactIban = document.getElementById('newContactIban');
    const newContactSave = document.getElementById('newContactSave');
    const addNewContact = document.getElementById('addNewContact');
    const nameInput = document.getElementById('newContactNameInput');
    const ibanInput = document.getElementById('newContactIbanInput');

    if (newContactName && newContactIban && newContactSave) {
      newContactName.style.display = 'none';
      newContactIban.style.display = 'none';
      newContactSave.style.display = 'none';
    }

    if (addNewContact) {
      addNewContact.style.display = '';

      addNewContact.textContent = _L('ui_add_new');
      addNewContact.classList.remove('contacts-cancel');
      addNewContact.classList.add('contacts-new');
    }

    if (nameInput) nameInput.value = '';
    if (ibanInput) ibanInput.value = '';


    const saveButton = document.getElementById('saveContactBtn');
    if (saveButton) {
      saveButton.disabled = true;
      saveButton.style.opacity = '0.5';
      saveButton.style.cursor = 'default';
    }
  }, 300);
  if (!keepOpen) {
    playerData.selectedContacts = {};
    const externalOption = document.getElementById('transfer_option_external');
    if (externalOption) {
      selectTransferRecipient(externalOption, 'external');
    }
  }
}


$(document).on('click', '#closeMultipleContactsModal, #multipleContactsModal', function (e) {

  if (e.target.id === 'multipleContactsModal' || e.target.id === 'closeMultipleContactsModal' || e.target.closest('#closeMultipleContactsModal')) {
    closeMultipleContactsModal();
  }
});


$(document).on('click', '#addNewContact', function () {
  const newContactName = document.getElementById('newContactName');
  const newContactIban = document.getElementById('newContactIban');
  const newContactSave = document.getElementById('newContactSave');
  const addNewContact = document.getElementById('addNewContact');
  const nameInput = document.getElementById('newContactNameInput');
  const ibanInput = document.getElementById('newContactIbanInput');

  if (!newContactName || !newContactIban || !newContactSave || !addNewContact) return;


  const isFormVisible = newContactName.style.display !== 'none' &&
    newContactName.style.display !== '';

  if (!isFormVisible) {

    newContactName.style.display = 'flex';
    newContactIban.style.display = 'flex';
    newContactSave.style.display = 'flex';


    addNewContact.textContent = _L('ui_cancel');
    addNewContact.classList.remove('contacts-new', 'contacts-new-blocked');
    addNewContact.classList.add('contacts-cancel');


    if (nameInput) {
      setTimeout(() => nameInput.focus(), 100);
    }


    setTimeout(() => validateSaveContactButton(), 50);
  } else {

    newContactName.style.display = 'none';
    newContactIban.style.display = 'none';
    newContactSave.style.display = 'none';


    addNewContact.textContent = _L('ui_add_new');
    addNewContact.classList.remove('contacts-cancel');
    addNewContact.classList.add('contacts-new');


    if (nameInput) nameInput.value = '';
    if (ibanInput) ibanInput.value = '';


    const saveButton = document.getElementById('saveContactBtn');
    if (saveButton) {
      saveButton.disabled = true;
      saveButton.style.opacity = '0.5';
      saveButton.style.cursor = 'default';
    }
  }
});


$(document).on('input', '#newContactNameInput, #newContactIbanInput', function () {
  validateSaveContactButton();
});


function validateSaveContactButton() {
  const nameInput = document.getElementById('newContactNameInput');
  const ibanInput = document.getElementById('newContactIbanInput');
  const saveBtn = document.getElementById('saveContactBtn');

  if (!nameInput || !ibanInput || !saveBtn) return;

  const name = nameInput.value?.trim() || '';
  const iban = ibanInput.value?.trim() || '';
  const isValid = name.length > 0 && iban.length > 0;

  saveBtn.disabled = !isValid;
  saveBtn.style.opacity = isValid ? '1' : '0.5';
  saveBtn.style.cursor = isValid ? 'pointer' : 'default';
}


$(document).on('click', '#saveContactBtn', async function () {
  const btn = this;
  if (btn.disabled) return;


  const nameInput = document.getElementById('newContactNameInput');
  const ibanInput = document.getElementById('newContactIbanInput');

  if (!nameInput || !ibanInput) {
    console.error('Contact input fields not found');
    return;
  }

  const name = nameInput.value;
  const iban = ibanInput.value;


  if (!playerData.bankContacts) {
    playerData.bankContacts = {};
  }

  const contactsCount = Object.keys(playerData.bankContacts).length

  const response = await fetch(`https://${GetParentResourceName()}/saveContact`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({ name, iban })
  });

  const data = await response.json();
  if (data.success) {
    playerData.bankContacts = data.result;
    updateMultipleContactsModal();
  }
});

$(document).on('click', '#confirmContactsBtn', function () {
  closeMultipleContactsModal(true);

  loadMultipleTransferModal();
});

function loadMultipleTransferModal() {
  const multipleContactsItem = document.getElementById('transfer_multiple_contacts_section');

  if (multipleContactsItem) {
    const contactCount = Object.keys(playerData.selectedContacts).length;


    if (contactCount >= 5) {
      multipleContactsItem.classList.add('has-scroll');
    } else {
      multipleContactsItem.classList.remove('has-scroll');
    }

    multipleContactsItem.innerHTML = Object.entries(playerData.selectedContacts).map(([iban, contact]) => `
      <div class="mc-item">
          <div class="modal-option-group w60 p-rel">
              <div class="modal-option-title">${_L('ui_recipient')}</div>
              <input type="text" class="form-control" value="${limitCharacters(contact.name, 18)}" readonly>
              <div class="mc-item-options">
                  <i class="fa-solid fa-circle-info mc-iban" data-tooltip="${_L('ui_iban')}: ${iban}" style="text-transform: uppercase;"></i>
                  <i class="fa-solid fa-circle-minus mc-remove" data-tooltip="${_L('ui_remove')}" onclick="removeTransferContact('${iban}')"></i>
              </div>
          </div>
          <div class="modal-option-group w40">
              <div class="modal-option-title">${_L('ui_amount')}</div>
              <input min="0" type="number" class="form-control" placeholder="1000" id="transfer_amount_${iban}" onkeyup="checkTransferInfo()" onkeypress="return (event.charCode >= 48 && event.charCode <= 57)" onpaste="event.preventDefault(); this.value = (event.clipboardData.getData('text')).replace(/[^0-9]/g, ''); checkTransferInfo()">
          </div>
      </div>
    `).join('');


    multipleContactsItem.querySelectorAll('[data-tooltip]').forEach(el => {
      el.addEventListener('mouseenter', function () {
        showCustomTooltip(this, this.dataset.tooltip);
      });
      el.addEventListener('mouseleave', hideCustomTooltip);
    });


    checkTransferInfo();
  }
}

function removeTransferContact(iban) {

  hideCustomTooltip();


  const savedAmounts = {};
  const multipleContactsSection = document.getElementById('transfer_multiple_contacts_section');
  if (multipleContactsSection) {
    const amountInputs = multipleContactsSection.querySelectorAll('input[type="number"]');
    amountInputs.forEach(input => {
      const inputIban = input.id.replace('transfer_amount_', '');
      if (inputIban !== iban && input.value) {
        savedAmounts[inputIban] = input.value;
      }
    });
  }


  delete playerData.selectedContacts[iban];


  loadMultipleTransferModal();


  Object.entries(savedAmounts).forEach(([savedIban, value]) => {
    const input = document.getElementById(`transfer_amount_${savedIban}`);
    if (input) {
      input.value = value;
    }
  });

  checkTransferInfo();
}


function filterContacts(searchQuery) {
  if (!playerData.bankContacts) return;

  const query = String(searchQuery || '').trim().toLowerCase();
  const originalContacts = playerData.bankContacts;

  if (!query) {

    __contactsFilter = null;
  } else {

    const filteredContacts = {};
    Object.entries(originalContacts).forEach(([iban, contact]) => {

      const contactName = String(contact.name || '').toLowerCase();
      if (contactName.includes(query)) {
        filteredContacts[iban] = contact;
        return;
      }
    });
    __contactsFilter = filteredContacts;
  }


  updateMultipleContactsModal();
}

function updateMultipleContactsModal() {
  const contactsList = document.getElementById('multipleContactsList');
  const contactsFavoritesList = document.getElementById('contactsFavoritesList');


  if (!playerData.bankContacts) {
    playerData.bankContacts = {};
  }


  const contactsToDisplay = __contactsFilter !== null ? __contactsFilter : playerData.bankContacts;

  const contactsCount = Object.keys(contactsToDisplay).length;
  const contactsFavoritesCount = Object.keys(contactsToDisplay).filter(iban => contactsToDisplay[iban].is_favorite).length;
  const confirmContactsBtn = document.getElementById('confirmContactsBtn');

  if (!playerData.selectedContacts) {
    playerData.selectedContacts = {};
  }

  if (confirmContactsBtn) {
    confirmContactsBtn.textContent = _L('ui_confirm') + ' (' + Object.keys(playerData.selectedContacts).length + ')';
    confirmContactsBtn.style.opacity = Object.keys(playerData.selectedContacts).length > 0 ? '1' : '0.5';
    confirmContactsBtn.style.cursor = Object.keys(playerData.selectedContacts).length > 0 ? 'pointer' : 'default';
  }

  $('#multipleContactsCount').text(_L('ui_contacts') + ' (' + contactsCount + ')');
  $('#contactsFavoritesCount').text(_L('ui_favorites') + ' (' + contactsFavoritesCount + '/' + maxTransferContactsFavorites + ')');

  if (contactsCount > 0) {
    const nonFavoriteContacts = Object.entries(contactsToDisplay).filter(([iban, contact]) => !contact.is_favorite);
    if (nonFavoriteContacts.length > 0) {
      contactsList.innerHTML = nonFavoriteContacts.map(([iban, contact]) => `
        <div class="contact-div ${playerData.selectedContacts[iban] ? 'cd-selected' : ''}">
            <div class="contact-name-div">
                <div class="contact-name">${limitCharacters(contact.name, 21)}</div>
                <i class="fa-solid fa-star contact-fav" onclick="toggleContactFavorite('${iban}')"></i>
            </div>
            <div class="contact-options">
                <div class="contact-delete" onclick="deleteContact('${iban}')">${_L('ui_delete')}</div>
                <div class="${playerData.selectedContacts[iban] ? 'contact-selected' : 'contact-select'}" onclick="selectContact('${iban}', '${contact.name}', '${contact.account_type}')">${playerData.selectedContacts[iban] ? _L('ui_selected') : _L('ui_select')}</div>
            </div>
        </div>
      `).join('');
    } else {
      contactsList.innerHTML = `
        <div class="contact-div">
            <div class="contact-name-div">
                <div class="ci-inactive">${_L('ui_no_contacts')}</div>
            </div>
        </div>`;
    }
  } else {
    contactsList.innerHTML = `
      <div class="contact-div">
          <div class="contact-name-div">
              <div class="ci-inactive">${_L('ui_no_contacts')}</div>
          </div>
      </div>`;
  }

  if (contactsFavoritesCount > 0) {
    contactsFavoritesList.innerHTML = Object.entries(contactsToDisplay).filter(([iban, contact]) => contact.is_favorite).map(([iban, contact]) => `
      <div class="contact-div ${playerData.selectedContacts[iban] ? 'cd-selected' : ''}">
          <div class="contact-name-div">
              <div class="contact-name">${limitCharacters(contact.name, 21)}</div>
              <i class="fa-solid fa-star contact-fav-true" onclick="toggleContactFavorite('${iban}')"></i>
          </div>
          <div class="contact-options">
              <div class="contact-delete" onclick="deleteContact('${iban}')">${_L('ui_delete')}</div>
              <div class="${playerData.selectedContacts[iban] ? 'contact-selected' : 'contact-select'}" onclick="selectContact('${iban}', '${contact.name}', '${contact.account_type}')">${playerData.selectedContacts[iban] ? _L('ui_selected') : _L('ui_select')}</div>
          </div>
      </div>
    `).join('');
  } else {
    contactsFavoritesList.innerHTML = `
      <div class="contact-div">
          <div class="contact-name-div">
              <div class="ci-inactive">${_L('ui_no_favorite_contacts')}</div>
          </div>
      </div>`;
  }
}

async function deleteContact(iban) {
  if (playerData.selectedContacts[iban]) {
    delete playerData.selectedContacts[iban];
  }

  const response = await fetch(`https://${GetParentResourceName()}/deleteContact`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({ iban })
  });

  const data = await response.json();
  if (data.success) {
    playerData.bankContacts = data.result;

    const searchInput = document.getElementById('multipleContactsSearch');
    if (searchInput && searchInput.value.trim()) {
      filterContacts(searchInput.value);
    } else {
      __contactsFilter = null;
      updateMultipleContactsModal();
    }
  }
}

async function selectContact(iban, name, accountType) {
  if (!playerData.selectedContacts) {
    playerData.selectedContacts = {};
  }

  if (playerData.selectedContacts[iban]) {
    delete playerData.selectedContacts[iban];
  } else {
    playerData.selectedContacts[iban] = {
      name: name,
      accountType: accountType
    };
  }

  updateMultipleContactsModal();
}

var canFavorite = true;

async function toggleContactFavorite(iban) {

  if (!playerData.bankContacts) {
    playerData.bankContacts = {};
  }
  const contactsFavoritesCount = Object.keys(playerData.bankContacts).filter(iban => playerData.bankContacts[iban].is_favorite).length;
  var isFavorite = playerData.bankContacts[iban] && playerData.bankContacts[iban].is_favorite;
  if (contactsFavoritesCount >= maxTransferContactsFavorites && !isFavorite) {
    if (canFavorite) {
      canFavorite = false;
      fetch(`https://${GetParentResourceName()}/SendNotification`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({
          localeKey: 'max_favorites_reached'
        })
      });
      setTimeout(() => {
        canFavorite = true;
      }, 1000);
    }
    return;
  }

  const response = await fetch(`https://${GetParentResourceName()}/toggleContactFavorite`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({ iban })
  });

  const data = await response.json();
  if (data.success) {
    playerData.bankContacts = data.result;

    const searchInput = document.getElementById('multipleContactsSearch');
    if (searchInput && searchInput.value.trim()) {
      filterContacts(searchInput.value);
    } else {
      __contactsFilter = null;
      updateMultipleContactsModal();
    }
  }
}

$(document).on('click', '#closeCreateNewGoalModal', function () {
  const m = document.getElementById('createNewGoalModal');
  m.classList.remove('show');
  setTimeout(() => {
    m.style.display = 'none';

    document.getElementById('goalName').value = '';
    document.getElementById('targetAmount').value = '';
    document.getElementById('initialDeposit').value = '';
    validateCreateGoalButton();
  }, 300);
});
$(document).on('click', '#createNewGoalModal', function (e) {
  if (e.target !== this) return;
  const m = this;
  m.classList.remove('show');
  setTimeout(() => {
    m.style.display = 'none';

    document.getElementById('goalName').value = '';
    document.getElementById('targetAmount').value = '';
    document.getElementById('initialDeposit').value = '';
    validateCreateGoalButton();
  }, 300);
});

$(document).on('click', '.nav-item.overview', function () { if (currentPage !== 'overview') switchPage('overview'); });
$(document).on('click', '.nav-item.loans', function () { if (currentPage !== 'loans') switchPage('loans'); });
$(document).on('click', '.nav-item.savings', function () { if (currentPage !== 'savings') switchPage('savings'); });
$(document).on('click', '.nav-item.bills', function () { if (currentPage !== 'bills') switchPage('bills'); });
$(document).on('click', '.nav-item.transactions, .view-transactions', async function () {
  if (currentPage === 'transactions') return;
  const pre = preloadActiveTransactions();
  switchPage('transactions');
  pre.then(() => {
    if (currentPage === 'transactions') {
      applyCurrentAccountToUI();
    }
  });
});

document.addEventListener('click', function (e) {
  const dd = document.querySelector('.account-dropdown');
  const menu = document.getElementById('accountDropdownMenu');
  const arrow = document.querySelector('.dropdown-arrow');
  const settingsButton = document.getElementById('accountSettingsButton');


  if (settingsButton && (e.target === settingsButton || settingsButton.contains(e.target))) {
    return;
  }

  if (dd && !dd.contains(e.target)) {
    if (menu) menu.classList.remove('show');
    if (arrow) arrow.classList.remove('rotated');
  }


  const customSelects = document.querySelectorAll('.custom-select-container');
  customSelects.forEach(container => {
    if (!container.contains(e.target)) {
      const menu = container.querySelector('.custom-select-menu');
      const arrow = container.querySelector('.custom-select-arrow');
      const current = container.querySelector('.custom-select-current');

      if (menu) menu.classList.remove('show');
      if (arrow) arrow.classList.remove('rotated');
      if (current) current.classList.remove('open');
    }
  });
});


function toggleCustomSelect(element) {
  const container = element.closest('.custom-select-container');
  const menu = container.querySelector('.custom-select-menu');
  const arrow = container.querySelector('.custom-select-arrow');


  document.querySelectorAll('.custom-select-container').forEach(otherContainer => {
    if (otherContainer !== container) {
      const otherMenu = otherContainer.querySelector('.custom-select-menu');
      const otherArrow = otherContainer.querySelector('.custom-select-arrow');
      const otherCurrent = otherContainer.querySelector('.custom-select-current');

      if (otherMenu) otherMenu.classList.remove('show');
      if (otherArrow) otherArrow.classList.remove('rotated');
      if (otherCurrent) otherCurrent.classList.remove('open');
    }
  });


  menu.classList.toggle('show');
  arrow.classList.toggle('rotated');
  element.classList.toggle('open');
}


function toggleLoanTermSelect(element) {
  if (!element) return;

  const container = element.closest('.custom-select-container');
  if (!container) return;

  const menu = container.querySelector('.custom-select-menu');
  const arrow = container.querySelector('.custom-select-arrow');

  if (!menu || !arrow) return;


  document.querySelectorAll('.custom-select-container').forEach(otherContainer => {
    if (otherContainer !== container) {
      const otherMenu = otherContainer.querySelector('.custom-select-menu');
      const otherArrow = otherContainer.querySelector('.custom-select-arrow');
      const otherCurrent = otherContainer.querySelector('.custom-select-current');

      if (otherMenu) otherMenu.classList.remove('show');
      if (otherArrow) otherArrow.classList.remove('rotated');
      if (otherCurrent) otherCurrent.classList.remove('open');
    }
  });


  menu.classList.toggle('show');
  arrow.classList.toggle('rotated');
  element.classList.toggle('open');
}


window.toggleLoanTermSelect = toggleLoanTermSelect;


function updateTransferModalLayout(recipientType, options = {}) {
  const defaults = {
    showMultipleContacts: false,
    showAmount: true,
    showIban: true,
    ibanValue: '',
    ibanReadonly: false
  };

  const config = { ...defaults, ...options };


  const multipleContactsSection = document.getElementById('transfer_multiple_contacts_section');
  const amountGroup = document.getElementById('transfer_amount_group');
  const ibanGroup = document.getElementById('transfer_iban_group');
  const ibanInput = document.getElementById('transfer_iban');


  if (multipleContactsSection) {
    multipleContactsSection.style.display = config.showMultipleContacts ? 'flex' : 'none';
  }


  if (amountGroup) {
    amountGroup.style.display = config.showAmount ? 'flex' : 'none';
  }


  if (ibanGroup) {
    ibanGroup.style.display = config.showIban ? 'flex' : 'none';
  }


  if (ibanInput) {
    if (config.ibanValue) {
      ibanInput.value = config.ibanValue;
    }
    ibanInput.readOnly = config.ibanReadonly;
    if (config.ibanReadonly) {
      ibanInput.style.cursor = 'default';
      ibanInput.style.opacity = '0.7';
    } else {
      ibanInput.style.cursor = 'text';
      ibanInput.style.opacity = '1';
    }
  }


  checkIfEmpty();
}


function populateCustomAccountsInTransferModal() {

  const businessOption = document.getElementById('transfer_option_business');
  if (!businessOption) {
    return;
  }


  const hasValidSocietyData = societyData &&
    Object.keys(societyData).length > 0 &&
    (societyData.society || societyData.society_name || societyData.pincode || societyData.value !== undefined);

  if (hasValidSocietyData && currentAccountType !== 'business') {
    businessOption.style.display = 'flex';
  } else {
    businessOption.style.display = 'none';
  }


  const menu = businessOption.closest('.custom-select-menu');
  if (!menu) {
    return;
  }


  const existingCustomOptions = menu.querySelectorAll('[data-custom-account-identifier]');
  existingCustomOptions.forEach(opt => opt.remove());


  if (customAccountsData && Array.isArray(customAccountsData) && customAccountsData.length > 0) {
    customAccountsData.forEach((account) => {

      if (currentAccountType === `custom_${account.account_identifier}`) {
        return;
      }

      const option = document.createElement('div');
      option.className = 'custom-select-option cso2';
      option.setAttribute('data-account-identifier', account.account_identifier);
      option.setAttribute('data-iban', account.iban || '');


      option.setAttribute('data-custom-account-identifier', account.account_identifier);
      option.setAttribute('data-custom-account-iban', account.iban || '');
      option.setAttribute('data-custom-account-name', account.account_name || account.owner_name || 'Custom Account');

      option.onclick = function () {
        selectTransferRecipient(this, 'custom', account.account_identifier, account.iban || '');
      };

      const accountTypeText = account.is_owner ? _L('ui_owner') : _L('ui_user');
      option.innerHTML = `
        <div style="display: flex; gap: 0.5rem;">
          <div class="cso2s"><i class="fa-solid fa-user-group cso2fa"></i></div>
          <div>
            <div>${account.account_name || account.owner_name || 'Custom Account'}</div>
          </div>
        </div>
        <i class="fa-solid fa-check option-check"></i>`;


      businessOption.insertAdjacentElement('afterend', option);
    });
  }
}


function selectTransferRecipient(element, recipientType, accountIdentifier, accountIban) {

  currentTransferRecipientType = recipientType;


  if (recipientType === 'custom' && accountIdentifier) {
    element.setAttribute('data-selected-account', accountIdentifier);
    element.setAttribute('data-selected-iban', accountIban || '');
  }


  const container = element.closest('.custom-select-container');
  const textElement = container.querySelector('.custom-select-text');
  const menu = container.querySelector('.custom-select-menu');
  const arrow = container.querySelector('.custom-select-arrow');
  const current = container.querySelector('.custom-select-current');


  container.querySelectorAll('.custom-select-option').forEach(opt => {
    opt.classList.remove('selected');
  });


  element.classList.add('selected');


  let textToSet = '';
  if (recipientType === 'custom') {

    textToSet = element.getAttribute('data-custom-account-name') || '';
    if (!textToSet) {

      const accountNameDiv = element.querySelector('div > div:last-child > div:first-child');
      if (accountNameDiv) {
        textToSet = accountNameDiv.textContent.trim();
      }
    }
  } else {
    const textDiv = element.querySelector('div > div:last-child');
    if (textDiv) {
      textToSet = textDiv.textContent.trim();
    } else {

      const allDivs = element.querySelectorAll('div');
      for (let div of allDivs) {
        const text = div.textContent.trim();
        if (text && text.length > 0 && !text.includes('fa-')) {
          textToSet = text;
          break;
        }
      }
    }
  }
  if (textToSet && textElement) {
    textElement.textContent = textToSet;
  }


  if (menu) menu.classList.remove('show');
  if (arrow) arrow.classList.remove('rotated');
  if (current) current.classList.remove('open');


  const ibanInput = document.getElementById('transfer_iban');
  if (ibanInput) {
    ibanInput.value = '';
  }


  switch (recipientType) {
    case 'external':
      updateTransferModalLayout('external', {
        showMultipleContacts: false,
        showAmount: true,
        showIban: true,
        ibanValue: '',
        ibanReadonly: false
      });
      break;

    case 'savings':
      updateTransferModalLayout('savings', {
        showMultipleContacts: false,
        showAmount: true,
        showIban: false,
        ibanValue: '',
        ibanReadonly: false
      });
      break;

    case 'business':

      const businessIban = societyData?.iban || '';
      updateTransferModalLayout('business', {
        showMultipleContacts: false,
        showAmount: true,
        showIban: true,
        ibanValue: businessIban,
        ibanReadonly: true
      });
      break;

    case 'custom':

      const customIban = accountIban || element.getAttribute('data-custom-account-iban') || element.getAttribute('data-iban') || '';
      const customAccountName = element.getAttribute('data-custom-account-name') || '';


      if (customAccountName && textElement) {
        textElement.textContent = customAccountName;
      }

      updateTransferModalLayout('custom', {
        showMultipleContacts: false,
        showAmount: true,
        showIban: true,
        ibanValue: customIban,
        ibanReadonly: true
      });
      break;

    case 'multiple':
      setTimeout(() => {
        updateTransferModalLayout('multiple', {
          showMultipleContacts: true,
          showAmount: false,
          showIban: false,
          ibanValue: '',
          ibanReadonly: false
        });
      }, 200);
      openMultipleContactsModal();
      break;

    case 'contact':
    case 'sharedaccount1':

      updateTransferModalLayout(recipientType, {
        showMultipleContacts: false,
        showAmount: true,
        showIban: true,
        ibanValue: '',
        ibanReadonly: false
      });
      break;

    default:

      updateTransferModalLayout('external', {
        showMultipleContacts: false,
        showAmount: true,
        showIban: true,
        ibanValue: '',
        ibanReadonly: false
      });
  }
}


function initializeTransferModal() {

  const modalTitle = document.getElementById('transfer_money_title');
  if (modalTitle) modalTitle.textContent = _L('ui_transfer_money');


  const recipientLabel = document.querySelector('#transfer_recipient_group .modal-option-title');
  if (recipientLabel) recipientLabel.textContent = _L('ui_recipient');

  const ibanLabel = document.querySelector('#transfer_iban_group .modal-option-title');
  if (ibanLabel) ibanLabel.textContent = _L('ui_iban');

  const amountLabel = document.querySelector('#transfer_amount_group .modal-option-title');
  if (amountLabel) amountLabel.textContent = _L('ui_amount');


  const externalOptionText = document.querySelector('#transfer_option_external div:last-child');
  if (externalOptionText) externalOptionText.textContent = _L('ui_external_account');

  const savingsOptionText = document.querySelector('#transfer_option_savings div:last-child');
  if (savingsOptionText) savingsOptionText.textContent = _L('ui_savings_account');

  const businessOptionText = document.querySelector('#transfer_option_business div:last-child');
  if (businessOptionText) businessOptionText.textContent = _L('ui_business_account');

  const multipleOptionText = document.querySelector('#transfer_custom_accounts_menu .custom-select-option:last-child div:last-child');
  if (multipleOptionText && multipleOptionText.textContent.includes('Multiple')) multipleOptionText.textContent = _L('ui_multiple_contacts');


  const amountInput = document.getElementById('transfer_amount');
  const ibanInput = document.getElementById('transfer_iban');
  if (amountInput) amountInput.value = '';
  if (ibanInput) {
    ibanInput.value = '';
    ibanInput.readOnly = false;
    ibanInput.style.cursor = 'text';
    ibanInput.style.opacity = '1';
  }


  const businessOption = document.getElementById('transfer_option_business');
  if (businessOption) {
    const hasValidSocietyData = societyData &&
      Object.keys(societyData).length > 0 &&
      (societyData.society || societyData.society_name || societyData.pincode || societyData.value !== undefined);

    if (hasValidSocietyData && currentAccountType !== 'business') {
      businessOption.style.display = 'flex';
    } else {
      businessOption.style.display = 'none';
    }
  }


  const savingsOption = document.getElementById('transfer_option_savings');
  if (savingsOption) {
    if (currentAccountType === 'savings') {
      savingsOption.style.display = 'none';
    } else {
      savingsOption.style.display = 'flex';
    }
  }


  currentTransferRecipientType = 'external';


  populateCustomAccountsInTransferModal();


  const externalOption = document.getElementById('transfer_option_external');
  if (externalOption) {
    selectTransferRecipient(externalOption, 'external');
  } else {

    updateTransferModalLayout('external', {
      showMultipleContacts: false,
      showAmount: true,
      showIban: true,
      ibanValue: '',
      ibanReadonly: false
    });
  }


  const transferBtn = document.getElementById('transfer_btn');
  if (transferBtn) transferBtn.disabled = true;
}

function selectCustomOption(element, value) {
  const container = element.closest('.custom-select-container');
  const textElement = container.querySelector('.custom-select-text');
  const menu = container.querySelector('.custom-select-menu');
  const arrow = container.querySelector('.custom-select-arrow');
  const current = container.querySelector('.custom-select-current');


  container.querySelectorAll('.custom-select-option').forEach(opt => {
    opt.classList.remove('selected');
  });


  element.classList.add('selected');
  textElement.textContent = element.querySelector('span').textContent;


  if (container.classList.contains('select-card-type') || container.querySelector('.cards-list')) {
    selectedCardType = value;
    validateCardCreation();
  }


  if (value === 'all' || value === 'checking' || value === 'savings') {
    selectedAccountFilter = value;

    const searchInput = document.getElementById('transactionsSearch');
    const searchQuery = searchInput ? searchInput.value : '';
    filterTransactions(searchQuery);

    updateTransactionsStatistics(__txPager.txs);

    showTxPage(1);

    updateAccountFilterDropdown();
  }


  menu.classList.remove('show');
  arrow.classList.remove('rotated');
  current.classList.remove('open');
}

function selectCustomOptionCardStatus(element, value) {

  var cardsInfo = getCurrentCards();
  if (cardsInfo.length === 0 || selectedCardIndex < 0 || selectedCardIndex >= cardsInfo.length) {
    return;
  }


  const modal = document.getElementById('manageCardModal');
  const manageCardStatusText = modal ? modal.querySelector('.custom-select-text.manage-card-status') : document.querySelector('.manage-card-status.custom-select-text, .custom-select-text.manage-card-status');
  const manageCardStatusInput = modal ? modal.querySelector('.manage-card-status[type="hidden"]') : document.querySelector('.manage-card-status[type="hidden"]');
  const manageCardStatusOption = modal ? modal.querySelector('.manage-card-status-option-text') : document.querySelector('.manage-card-status-option-text');
  const manageCardStatusOptionCard = modal ? modal.querySelector('.manage-card-status-option-card') : document.querySelector('.manage-card-status-option-card');
  const container = element.closest('.custom-select-container');
  const menu = container.querySelector('.custom-select-menu');
  const arrow = container.querySelector('.custom-select-arrow');
  const current = container.querySelector('.custom-select-current');

  if (value === 'blocked') {
    if (manageCardStatusText) manageCardStatusText.textContent = _L('ui_active');
    if (manageCardStatusOption) manageCardStatusOption.textContent = _L('ui_blocked');
    if (manageCardStatusInput) manageCardStatusInput.value = 'active';
    if (manageCardStatusOptionCard) {
      manageCardStatusOptionCard.onclick = function () {
        selectCustomOptionCardStatus(this, "active");
      };
    }
    if (cardsInfo[selectedCardIndex].status === 'blocked') {
      $('.manage-card-alert-blocking').hide();
      $('.manage-card-alert-activating').show();

      const activationFee = cardsConfig.creditCardActivationFee;
      updateCardAlertMessages(activationFee);
    } else {
      $('.manage-card-alert-blocking').hide();
      $('.manage-card-alert-activating').hide();
    }
  } else if (value === 'active') {
    if (manageCardStatusText) manageCardStatusText.textContent = _L('ui_blocked');
    if (manageCardStatusOption) manageCardStatusOption.textContent = _L('ui_active');
    if (manageCardStatusInput) manageCardStatusInput.value = 'blocked';
    if (manageCardStatusOptionCard) {
      manageCardStatusOptionCard.onclick = function () {
        selectCustomOptionCardStatus(this, "blocked");
      };
    }
    if (cardsInfo[selectedCardIndex].status === 'active') {
      $('.manage-card-alert-activating').hide();
      $('.manage-card-alert-blocking').show();

      const activationFee = cardsConfig.creditCardActivationFee;
      updateCardAlertMessages(activationFee);
    } else {
      $('.manage-card-alert-activating').hide();
      $('.manage-card-alert-blocking').hide();
    }
  } else if (value === 'pending') {

    if (manageCardStatusText) manageCardStatusText.textContent = _L('ui_pending');
    if (manageCardStatusOption) manageCardStatusOption.textContent = _L('ui_active');
    if (manageCardStatusInput) manageCardStatusInput.value = 'pending';
    if (manageCardStatusOptionCard) {
      manageCardStatusOptionCard.onclick = function () {
        selectCustomOptionCardStatus(this, "pending_to_active");
      };
    }

    $('.manage-card-alert-blocking').hide();
    $('.manage-card-alert-activating').hide();
  } else if (value === 'pending_to_active') {

    if (manageCardStatusText) manageCardStatusText.textContent = _L('ui_active');
    if (manageCardStatusOption) manageCardStatusOption.textContent = _L('ui_pending');
    if (manageCardStatusInput) {
      manageCardStatusInput.value = 'active';
    }
    if (manageCardStatusOptionCard) {
      manageCardStatusOptionCard.onclick = function () {
        selectCustomOptionCardStatus(this, "pending");
      };
    }
    $('.manage-card-alert-blocking').hide();
    $('.manage-card-alert-activating').show();

    const activationFee = cardsConfig.creditCardRenewalFee || cardsConfig.creditCardActivationFee;
    updateCardAlertMessages(activationFee);
  }

  menu.classList.remove('show');
  arrow.classList.remove('rotated');
  current.classList.remove('open');
}

function confirmManageCard() {

  var cardsInfo = getCurrentCards();
  if (cardsInfo.length === 0 || selectedCardIndex < 0 || selectedCardIndex >= cardsInfo.length) {
    return;
  }


  var statusInput = document.querySelector('#manageCardModal .manage-card-status[type="hidden"]');
  var status = statusInput ? statusInput.value : $('.manage-card-status').val();
  var autoRenew = $('.auto-renew-toggle').val();
  const m = document.getElementById('manageCardModal');
  m.classList.remove('show');
  setTimeout(() => { m.style.display = 'none'; }, 300);
  if (status !== cardsInfo[selectedCardIndex].status || autoRenew !== cardsInfo[selectedCardIndex].auto_renew) {

    var currentCard = cardsInfo[selectedCardIndex];
    fetch(`https://${GetParentResourceName()}/manageCard`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ status, autoRenew, currentCard, accountType: currentAccountType })
    })
      .then(r => r.json())
      .then(data => {
        if (data.success) {

          if (currentAccountType === 'personal') {
            playerData.playerPIN = data.cardsData;
          } else if (currentAccountType === 'business') {
            businessCardsData = data.cardsData;
          } else if (currentAccountType && currentAccountType.startsWith('custom_')) {

            const accountIdentifier = currentAccountType.replace('custom_', '');
            try {
              const updatedCards = typeof data.cardsData === 'string'
                ? JSON.parse(data.cardsData)
                : data.cardsData;
              customAccountCardsData[accountIdentifier] = updatedCards;

              const accountKey = currentAccountType;
              if (accounts[accountKey] && accounts[accountKey].accountData) {

                if (data.bankMoney !== undefined) {
                  accounts[accountKey].accountData.balance = data.bankMoney;

                  const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === accountIdentifier);
                  if (accountIndex !== -1) {
                    customAccountsData[accountIndex].balance = data.bankMoney;
                  }
                }
              }
            } catch (e) {
              console.error('[confirmManageCard] Error parsing custom account cards:', e);
            }
          }
          setCardsInfo();


          if (data.transactions) {
            const txs = normalizeTransactionsPayload(data.transactions);
            setActiveTransactions(txs);
            if (currentAccountType && currentAccountType.startsWith('custom_')) {

              const accountKey = currentAccountType;
              const account = accounts[accountKey];
              if (account && account.accountData) {
                account.accountData.transactions = txs;
              }
            }
            if (currentPage === 'overview') {
              populateLastTransactions(txs);
            }
          }


          if (data.bankMoney !== undefined) {

            updatePlayerMoney(data.bankMoney);
          }
        }
      });
  }
}

async function refreshTransactions() {
  await preloadActiveTransactions();
  applyCurrentAccountToUI();

}

function updatePlayerMoney(bankMoney) {
  if (typeof bankMoney !== 'number') return;
  if (currentAccountType === 'business') {
    societyData.value = bankMoney;
  } else if (currentAccountType === 'savings') {

    if (openedAccount === 'business' && societyData) {
      societyData.savings = societyData.savings || {};
      societyData.savings.balance = bankMoney;
    } else {
      playerData.savings = playerData.savings || {};
      playerData.savings.balance = bankMoney;
    }
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {

    const accountKey = currentAccountType;
    const account = accounts[accountKey];
    if (account) {
      account.accountData.balance = bankMoney;

      const accountIdentifier = currentAccountType.replace('custom_', '');
      const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === accountIdentifier);
      if (accountIndex !== -1) {
        customAccountsData[accountIndex].balance = bankMoney;
      }
    }

    $('.balance-value').text(formatCurrency(bankMoney));
    return;
  } else {

    playerData.playerBankMoney = bankMoney;
  }
  $('.balance-value').text(formatCurrency(bankMoney));
}

function setWalletMoney(walletMoney) {
  if (typeof walletMoney !== 'number') return;
  playerData.playerWalletMoney = walletMoney;
  $('.wallet').text(formatCurrency(walletMoney));
}


$(document).on('click', '#depositButton', function () {
  const m = document.getElementById('depositModal');


  const title = m.querySelector('.modal-t');
  if (title) title.textContent = _L('ui_deposit_money');
  const amountLabel = m.querySelector('.modal-option-title');
  if (amountLabel) amountLabel.textContent = _L('ui_amount');
  const depositBtn = m.querySelector('#deposit_btn');
  if (depositBtn) depositBtn.textContent = _L('ui_deposit');

  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => m.classList.add('show'), 50);
});
$(document).on('click', '#withdrawButton', function () {
  const m = document.getElementById('withdrawModal');


  const title = m.querySelector('.modal-t');
  if (title) title.textContent = _L('ui_withdraw_money');
  const amountLabel = m.querySelector('.modal-option-title');
  if (amountLabel) amountLabel.textContent = _L('ui_amount');
  const withdrawBtn = m.querySelector('#withdraw_btn');
  if (withdrawBtn) withdrawBtn.textContent = _L('ui_withdraw');

  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => m.classList.add('show'), 50);
});
$(document).on('click', '#transferButton', function () {
  const m = document.getElementById('transferModal');
  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => {
    m.classList.add('show');


    setTimeout(() => {
      initializeTransferModal();
    }, 100);
  }, 50);
});

$(document).on('click', '#createNewCardButton', function () {

  if (this.disabled || this.classList.contains('disabled')) {
    return;
  }

  applyCardsInfo();
  const m = document.getElementById('createNewCardModal');
  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => m.classList.add('show'), 50);


  ensureCardButtonDisabled();
  validateCardCreation();
});

$(document).on('click', '#manageCardButton', function () {

  var cardsInfo = getCurrentCards();
  if (cardsInfo.length === 0 || selectedCardIndex < 0 || selectedCardIndex >= cardsInfo.length) {
    return;
  }

  const activeCardsCount = cardsInfo.filter(card => card.status === 'active').length;

  if (activeCardsCount >= cardsConfig.maxCreditCards && cardsInfo[selectedCardIndex].status === 'blocked') {
    const dropdown = document.getElementById('manage-card-status-current');
    if (dropdown) {
      dropdown.style.opacity = '0.5';
      dropdown.style.cursor = 'default';
      dropdown.style.pointerEvents = 'auto';
      dropdown.classList.add('disabled');
    }

    const tooltipHandlers = dropdown._tooltipHandlers || {};
    if (tooltipHandlers.mouseenter) {
      dropdown.removeEventListener('mouseenter', tooltipHandlers.mouseenter);
      dropdown.removeEventListener('mouseleave', tooltipHandlers.mouseleave);
    }
    if (tooltipHandlers.click) {
      dropdown.removeEventListener('click', tooltipHandlers.click);
    }


    tooltipHandlers.mouseenter = function () {
      showCustomTooltip(dropdown, 'You have reached the maximum number of active cards');
    };

    tooltipHandlers.mouseleave = function () {
      hideCustomTooltip();
    };


    tooltipHandlers.click = function (e) {
      e.preventDefault();
      e.stopPropagation();
      e.stopImmediatePropagation();
      return false;
    };


    dropdown._tooltipHandlers = tooltipHandlers;


    dropdown.addEventListener('mouseenter', tooltipHandlers.mouseenter);
    dropdown.addEventListener('mouseleave', tooltipHandlers.mouseleave);
    dropdown.addEventListener('click', tooltipHandlers.click, true);
  } else {

    const dropdown = document.getElementById('manage-card-status-current');
    if (dropdown) {

      const tooltipHandlers = dropdown._tooltipHandlers || {};
      if (tooltipHandlers.mouseenter) {
        dropdown.removeEventListener('mouseenter', tooltipHandlers.mouseenter);
        dropdown.removeEventListener('mouseleave', tooltipHandlers.mouseleave);
      }
      if (tooltipHandlers.click) {
        dropdown.removeEventListener('click', tooltipHandlers.click, true);
      }
      dropdown._tooltipHandlers = null;

      dropdown.style.opacity = '1';
      dropdown.style.cursor = 'pointer';
      dropdown.style.pointerEvents = 'auto';
      dropdown.classList.remove('disabled');
    }
  }

  const manageCardStatusText = document.querySelector('.manage-card-status.custom-select-text, .custom-select-text.manage-card-status');
  const manageCardStatusInput = document.querySelector('.manage-card-status[type="hidden"]');
  const manageCardStatusOption = document.querySelector('.manage-card-status-option-text');
  const manageCardStatusOptionCard = document.querySelector('.manage-card-status-option-card');

  $('.manage-card-alert-blocking').hide();
  $('.manage-card-alert-activating').hide();

  const toggleSwitch = document.querySelector('.toggle-switch');
  var autoRenew = cardsInfo[selectedCardIndex].auto_renew;
  toggleSwitch.classList.remove('on', 'off');
  toggleSwitch.classList.add(autoRenew ? 'on' : 'off');
  $('.auto-renew-toggle').val(autoRenew ? true : false);


  let activationFee;
  if (cardsInfo[selectedCardIndex].status === 'pending') {
    activationFee = cardsConfig.creditCardRenewalFee || cardsConfig.creditCardActivationFee;
  } else {
    activationFee = cardsConfig.creditCardActivationFee;
  }
  $('.activation-fee').text(formatCurrency(activationFee));


  updateCardAlertMessages(activationFee);


  if (cardsInfo[selectedCardIndex].expiration_date) {
    $('.current-expiry').html(formatExpirationDate(cardsInfo[selectedCardIndex].expiration_date) + '&nbsp;');
  }


  const expiryWarning = $('.expiry-warning');
  if (cardsInfo[selectedCardIndex].time_until_expiry) {
    expiryWarning.text(cardsInfo[selectedCardIndex].time_until_expiry);

    if (cardsInfo[selectedCardIndex].time_until_expiry.includes('day') &&
      parseInt(cardsInfo[selectedCardIndex].time_until_expiry.match(/\d+/)) < 7) {
    }
  }

  if (cardsInfo[selectedCardIndex].status === 'active') {
    if (manageCardStatusText) manageCardStatusText.textContent = _L('ui_active');
    if (manageCardStatusOption) manageCardStatusOption.textContent = _L('ui_blocked');
    if (manageCardStatusInput) manageCardStatusInput.value = 'active';
    if (manageCardStatusOptionCard) {
      manageCardStatusOptionCard.onclick = function () {
        selectCustomOptionCardStatus(this, "active");
      };
    }
  } else if (cardsInfo[selectedCardIndex].status === 'blocked') {
    if (manageCardStatusText) manageCardStatusText.textContent = _L('ui_blocked');
    if (manageCardStatusOption) manageCardStatusOption.textContent = _L('ui_active');
    if (manageCardStatusInput) manageCardStatusInput.value = 'blocked';
    if (manageCardStatusOptionCard) {
      manageCardStatusOptionCard.onclick = function () {
        selectCustomOptionCardStatus(this, "blocked");
      };
    }
  } else if (cardsInfo[selectedCardIndex].status === 'pending') {
    if (manageCardStatusText) manageCardStatusText.textContent = _L('ui_pending');
    if (manageCardStatusOption) manageCardStatusOption.textContent = _L('ui_active');
    if (manageCardStatusInput) manageCardStatusInput.value = 'pending';
    if (manageCardStatusOptionCard) {
      manageCardStatusOptionCard.onclick = function () {
        selectCustomOptionCardStatus(this, "pending_to_active");
      };
    }

    $('.manage-card-alert-blocking').hide();
    $('.manage-card-alert-activating').hide();
  }
  const m = document.getElementById('manageCardModal');
  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => m.classList.add('show'), 50);
});

$(document).on('click', '#accountUsersButton', function () {
  const m = document.getElementById('accountUsersModal');
  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => m.classList.add('show'), 50);


  populateAccountUsersModal();


  exitEditMode();


  const saveBtn = document.getElementById('save_access_btn');
  if (saveBtn) {
    saveBtn.disabled = true;
    saveBtn.style.opacity = '0.5';
    saveBtn.style.cursor = 'not-allowed';
    saveBtn.style.pointerEvents = 'none';
  }


  const newUserRow = document.getElementById('newUserRow');
  if (newUserRow) {
    newUserRow.style.display = 'none';

    const playerIdInput = newUserRow.querySelector('.new-user');
    if (playerIdInput) {
      playerIdInput.value = '';
    }

    const checkboxes = newUserRow.querySelectorAll('.permission-checkbox');
    checkboxes.forEach(cb => {
      cb.classList.remove('checked');
    });

    const confirmBtn = newUserRow.querySelector('.confirm-user-btn');
    if (confirmBtn) {
      confirmBtn.disabled = true;
      confirmBtn.style.opacity = '0.5';
      confirmBtn.style.cursor = 'not-allowed';
      confirmBtn.style.pointerEvents = 'none';
    }
  }
});


$(document).on('click', '.add-new-user', function (e) {
  e.stopPropagation();

  const newUserRow = document.getElementById('newUserRow');
  if (!newUserRow) return;


  const noUsersMessage = document.getElementById('noUsersMessage');
  if (noUsersMessage) {
    noUsersMessage.style.display = 'none';
  }


  newUserRow.style.display = 'flex';


  const checkboxes = newUserRow.querySelectorAll('.permission-checkbox');
  checkboxes.forEach(checkbox => {
    checkbox.style.cursor = 'pointer';
    checkbox.style.pointerEvents = 'auto';
  });


  updateLastVisibleRowBorderRadius();


  const playerIdInput = newUserRow.querySelector('.new-user');
  if (playerIdInput) {
    playerIdInput.focus();
  }
});


$(document).on('input', '.new-user', function (e) {
  const playerId = this.value.trim();
  const confirmBtn = document.querySelector('#newUserRow .confirm-user-btn');

  if (confirmBtn) {
    if (playerId && playerId.length > 0) {
      confirmBtn.disabled = false;
      confirmBtn.style.opacity = '1';
      confirmBtn.style.cursor = 'pointer';
      confirmBtn.style.pointerEvents = 'auto';
    } else {
      confirmBtn.disabled = true;
      confirmBtn.style.opacity = '0.5';
      confirmBtn.style.cursor = 'not-allowed';
      confirmBtn.style.pointerEvents = 'none';
    }
  }
});


$(document).on('click', '#newUserRow .permission-checkbox', function (e) {
  e.stopPropagation();
  this.classList.toggle('checked');
});


$(document).on('click', '#newUserRow .remove-user-btn', function (e) {
  e.stopPropagation();

  const newUserRow = document.getElementById('newUserRow');
  if (!newUserRow) return;


  newUserRow.style.display = 'none';
  const playerIdInput = newUserRow.querySelector('.new-user');
  if (playerIdInput) {
    playerIdInput.value = '';
  }

  const checkboxes = newUserRow.querySelectorAll('.permission-checkbox');
  checkboxes.forEach(cb => {
    cb.classList.remove('checked', 'editable');
    cb.style.cursor = '';
  });

  const confirmBtn = newUserRow.querySelector('.confirm-user-btn');
  if (confirmBtn) {
    confirmBtn.disabled = true;
    confirmBtn.style.opacity = '0.5';
    confirmBtn.style.cursor = 'not-allowed';
    confirmBtn.style.pointerEvents = 'none';
  }


  let accountUsers = [];
  if (currentAccountType === 'business' && societyData) {
    accountUsers = societyData.account_users || [];
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const customAccountId = currentAccountType.replace('custom_', '');
    const customAccount = customAccountsData.find(acc => acc.account_identifier === customAccountId);
    if (customAccount) {
      accountUsers = customAccount.account_users || [];
    }
  }


  const tableBody = document.querySelector('.users-table-body');
  const visibleUserRows = tableBody ? Array.from(tableBody.querySelectorAll('.user-row')).filter(row => {
    return row.id !== 'noUsersMessage' && row.id !== 'newUserRow' && window.getComputedStyle(row).display !== 'none';
  }) : [];


  const noUsersMessage = document.getElementById('noUsersMessage');
  if (noUsersMessage && (accountUsers.length === 0 || visibleUserRows.length === 0)) {
    noUsersMessage.style.display = 'flex';
  }


  updateLastVisibleRowBorderRadius();
});


$(document).on('click', '#newUserRow .confirm-user-btn', function (e) {
  e.stopPropagation();

  const newUserRow = document.getElementById('newUserRow');
  if (!newUserRow) return;

  const playerIdInput = newUserRow.querySelector('.new-user');
  if (!playerIdInput) return;

  const targetCitizenid = playerIdInput.value.trim();
  if (!targetCitizenid || targetCitizenid.length === 0) {
    return;
  }


  let accountIdentifier = null;
  if (currentAccountType === 'business' && societyData) {
    accountIdentifier = societyData.society;
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    accountIdentifier = currentAccountType.replace('custom_', '');
  }

  if (!accountIdentifier) {
    return;
  }


  const checkboxes = newUserRow.querySelectorAll('.permission-checkbox');
  const permissions = {
    deposit: checkboxes[0]?.classList.contains('checked') === true,
    withdraw: checkboxes[1]?.classList.contains('checked') === true,
    transfer: checkboxes[2]?.classList.contains('checked') === true,
    loans: checkboxes[3]?.classList.contains('checked') === true
  };


  fetch(`https://${GetParentResourceName()}/addAccountUser`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({
      accountIdentifier: accountIdentifier,
      citizenid: targetCitizenid,
      permissions: permissions
    })
  })
    .then(r => r.json())
    .then(data => {
      if (data.success) {

        fetch(`https://${GetParentResourceName()}/refreshAccountUsers`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json; charset=UTF-8' },
          body: JSON.stringify({
            accountIdentifier: accountIdentifier
          })
        })
          .then(r2 => r2.json())
          .then(refreshData => {
            if (refreshData.success && refreshData.account_users) {

              if (currentAccountType === 'business' && societyData) {
                societyData.account_users = refreshData.account_users;
              } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
                const customAccountId = currentAccountType.replace('custom_', '');
                const customAccount = customAccountsData.find(acc => acc.account_identifier === customAccountId);
                if (customAccount) {
                  customAccount.account_users = refreshData.account_users;
                }
              }
            } else {

              if (currentAccountType === 'business' && societyData) {
                if (!societyData.account_users) {
                  societyData.account_users = [];
                }
                societyData.account_users.push({
                  citizenid: targetCitizenid,
                  name: data.playerName || targetCitizenid,
                  permissions: {
                    deposit: permissions.deposit === true,
                    withdraw: permissions.withdraw === true,
                    transfer: permissions.transfer === true,
                    loans: permissions.loans === true
                  }
                });
              } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
                const customAccountId = currentAccountType.replace('custom_', '');
                const customAccount = customAccountsData.find(acc => acc.account_identifier === customAccountId);
                if (customAccount) {
                  if (!customAccount.account_users) {
                    customAccount.account_users = [];
                  }
                  customAccount.account_users.push({
                    citizenid: targetCitizenid,
                    name: data.playerName || targetCitizenid,
                    permissions: {
                      deposit: permissions.deposit === true,
                      withdraw: permissions.withdraw === true,
                      transfer: permissions.transfer === true,
                      loans: permissions.loans === true
                    }
                  });
                }
              }
            }


            newUserRow.style.display = 'none';
            playerIdInput.value = '';
            const checkboxes = newUserRow.querySelectorAll('.permission-checkbox');
            checkboxes.forEach(cb => {
              cb.classList.remove('checked', 'editable');
              cb.style.cursor = '';
            });
            const confirmBtn = newUserRow.querySelector('.confirm-user-btn');
            if (confirmBtn) {
              confirmBtn.disabled = true;
              confirmBtn.style.opacity = '0.5';
              confirmBtn.style.cursor = 'not-allowed';
              confirmBtn.style.pointerEvents = 'none';
            }


            populateAccountUsersModal();
          })
          .catch(() => {

            if (currentAccountType === 'business' && societyData) {
              if (!societyData.account_users) {
                societyData.account_users = [];
              }
              societyData.account_users.push({
                citizenid: targetCitizenid,
                name: data.playerName || targetCitizenid,
                permissions: {
                  deposit: permissions.deposit === true,
                  withdraw: permissions.withdraw === true,
                  transfer: permissions.transfer === true,
                  loans: permissions.loans === true
                }
              });
            } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
              const customAccountId = currentAccountType.replace('custom_', '');
              const customAccount = customAccountsData.find(acc => acc.account_identifier === customAccountId);
              if (customAccount) {
                if (!customAccount.account_users) {
                  customAccount.account_users = [];
                }
                customAccount.account_users.push({
                  citizenid: targetCitizenid,
                  name: data.playerName || targetCitizenid,
                  permissions: {
                    deposit: permissions.deposit === true,
                    withdraw: permissions.withdraw === true,
                    transfer: permissions.transfer === true,
                    loans: permissions.loans === true
                  }
                });
              }
            }


            newUserRow.style.display = 'none';
            playerIdInput.value = '';
            const checkboxes = newUserRow.querySelectorAll('.permission-checkbox');
            checkboxes.forEach(cb => {
              cb.classList.remove('checked', 'editable');
              cb.style.cursor = '';
            });
            const confirmBtn = newUserRow.querySelector('.confirm-user-btn');
            if (confirmBtn) {
              confirmBtn.disabled = true;
              confirmBtn.style.opacity = '0.5';
              confirmBtn.style.cursor = 'not-allowed';
              confirmBtn.style.pointerEvents = 'none';
            }


            populateAccountUsersModal();
          });
      }
    });
});


let editingUserId = null;

function enterEditMode(citizenid) {
  editingUserId = citizenid;


  const userRow = document.querySelector(`.user-row[data-citizenid="${citizenid}"]`);
  if (!userRow) return;


  const checkboxes = userRow.querySelectorAll('.permission-checkbox');
  checkboxes.forEach(checkbox => {
    checkbox.classList.add('editable');
    checkbox.style.cursor = 'pointer';
  });


  const editBtn = userRow.querySelector('.edit-permissions-btn');
  if (editBtn) {
    editBtn.innerHTML = '<i class="fa-solid fa-times"></i>';
    editBtn.dataset.tooltip = _L('ui_cancel');
    updateCustomTooltipText(editBtn, _L('ui_cancel'));
    editBtn.classList.add('cancel-edit-btn');
  }


  const saveBtn = document.getElementById('save_access_btn');
  if (saveBtn) {
    saveBtn.disabled = false;
    saveBtn.style.opacity = '1';
    saveBtn.style.cursor = 'pointer';
    saveBtn.style.pointerEvents = 'auto';
  }
}

function exitEditMode() {
  if (editingUserId) {
    const userRow = document.querySelector(`.user-row[data-citizenid="${editingUserId}"]`);
    if (userRow) {

      const checkboxes = userRow.querySelectorAll('.permission-checkbox');
      checkboxes.forEach(checkbox => {
        checkbox.classList.remove('editable');
        checkbox.style.cursor = '';
      });


      const editBtn = userRow.querySelector('.edit-permissions-btn');
      if (editBtn) {
        editBtn.innerHTML = '<i class="fa-solid fa-pencil"></i>';
        editBtn.dataset.tooltip = _L('ui_edit_permissions');
        updateCustomTooltipText(editBtn, _L('ui_edit_permissions'));
        editBtn.classList.remove('cancel-edit-btn');
      }
    }
  }
  editingUserId = null;


  const saveBtn = document.getElementById('save_access_btn');
  if (saveBtn) {
    saveBtn.disabled = true;
    saveBtn.style.opacity = '0.5';
    saveBtn.style.cursor = 'not-allowed';
    saveBtn.style.pointerEvents = 'none';
  }
}


$(document).on('click', '.edit-permissions-btn', function (e) {
  e.stopPropagation();
  const citizenid = this.getAttribute('data-citizenid');

  if (this.classList.contains('cancel-edit-btn')) {

    exitEditMode();

    populateAccountUsersModal();
  } else {

    if (editingUserId && editingUserId !== citizenid) {

      exitEditMode();
    }
    enterEditMode(citizenid);
  }
});


$(document).on('click', '.permission-checkbox.editable', function (e) {
  e.stopPropagation();
  const citizenid = this.getAttribute('data-citizenid');

  if (editingUserId === citizenid) {

    this.classList.toggle('checked');
  }
});


$(document).on('click', '.remove-user-btn', function (e) {
  e.stopPropagation();
  const targetCitizenid = this.getAttribute('data-citizenid');

  if (!targetCitizenid) {
    return;
  }


  const userRow = document.querySelector(`.user-row[data-citizenid="${targetCitizenid}"]`);
  if (!userRow) {
    return;
  }

  const userName = userRow.querySelector('.col-playerid')?.textContent?.trim() || targetCitizenid;


  let accountIdentifier = null;
  let accountName = '';
  if (currentAccountType === 'business' && societyData) {
    accountIdentifier = societyData.society;
    accountName = societyData.society_name || 'Business Account';
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    accountIdentifier = currentAccountType.replace('custom_', '');
    const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
    if (customAccount) {
      accountName = customAccount.account_name || customAccount.owner_name || 'Custom Account';
    }
  }

  if (!accountIdentifier) {
    return;
  }


  const confirmText = `${_L('ui_are_you_sure_remove_user').replace('{user}', userName).replace('{account}', accountName)}`;

  openConfirmModal(
    confirmText,
    _L('ui_remove_user'),
    'red',
    function () {

      fetch(`https://${GetParentResourceName()}/removeAccountUser`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({
          accountIdentifier: accountIdentifier,
          citizenid: targetCitizenid
        })
      })
        .then(r => r.json())
        .then(data => {
          if (data.success) {

            if (currentAccountType === 'business' && societyData) {
              if (societyData.account_users) {
                societyData.account_users = societyData.account_users.filter(u => u.citizenid !== targetCitizenid);
              }
            } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
              const customAccountId = currentAccountType.replace('custom_', '');
              const customAccount = customAccountsData.find(acc => acc.account_identifier === customAccountId);
              if (customAccount && customAccount.account_users) {
                customAccount.account_users = customAccount.account_users.filter(u => u.citizenid !== targetCitizenid);
              }
            }


            if (editingUserId === targetCitizenid) {
              exitEditMode();
            }


            populateAccountUsersModal();
          }
        });
    }
  );
});


$(document).on('click', '#save_access_btn', function (e) {
  e.stopPropagation();

  if (!editingUserId) {

    return;
  }


  let accountIdentifier = null;
  if (currentAccountType === 'business' && societyData) {
    accountIdentifier = societyData.society;
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    accountIdentifier = currentAccountType.replace('custom_', '');
  }

  if (!accountIdentifier) {
    return;
  }


  const userRow = document.querySelector(`.user-row[data-citizenid="${editingUserId}"]`);
  if (!userRow) {
    return;
  }


  const permissions = {
    deposit: userRow.querySelector('.permission-checkbox[data-permission="deposit"]')?.classList.contains('checked') || false,
    withdraw: userRow.querySelector('.permission-checkbox[data-permission="withdraw"]')?.classList.contains('checked') || false,
    transfer: userRow.querySelector('.permission-checkbox[data-permission="transfer"]')?.classList.contains('checked') || false,
    loans: userRow.querySelector('.permission-checkbox[data-permission="loans"]')?.classList.contains('checked') || false
  };


  fetch(`https://${GetParentResourceName()}/updateAccountUserPermissions`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({
      accountIdentifier: accountIdentifier,
      citizenid: editingUserId,
      permissions: permissions
    })
  })
    .then(r => r.json())
    .then(data => {
      if (data.success) {

        if (currentAccountType === 'business' && societyData) {
          const userIndex = (societyData.account_users || []).findIndex(u => u.citizenid === editingUserId);
          if (userIndex !== -1) {
            societyData.account_users[userIndex].permissions = permissions;
          }
        } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
          const customAccountId = currentAccountType.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === customAccountId);
          if (customAccount && customAccount.account_users) {
            const userIndex = customAccount.account_users.findIndex(u => u.citizenid === editingUserId);
            if (userIndex !== -1) {
              customAccount.account_users[userIndex].permissions = permissions;
            }
          }
        }


        exitEditMode();
        populateAccountUsersModal();
      }
    });
});

$(document).on('click', '#creditScoreButton', function () {
  const m = document.getElementById('creditScoreModal');


  const modalTitle = m.querySelector('.modal-t');
  if (modalTitle) modalTitle.textContent = _L('ui_credit_score_ranks');

  const alertTitle = m.querySelector('.alert-title');
  if (alertTitle) alertTitle.textContent = _L('ui_information');

  const alertMessage = m.querySelector('.alert-message');
  if (alertMessage) alertMessage.innerHTML = `${_L('ui_credit_score_info_text')} <span class="bold">${_L('ui_higher_scores_lower_rates')}</span>, ${_L('ui_lower_scores_increase')}`;


  const tableHeaders = m.querySelectorAll('.cst-col');
  if (tableHeaders.length >= 3) {
    tableHeaders[0].textContent = _L('ui_score');
    tableHeaders[1].textContent = _L('ui_rank');
    tableHeaders[2].textContent = _L('ui_rate');
  }

  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => m.classList.add('show'), 50);
});


function populateLoanModal(loan) {
  const modal = document.getElementById('manageLoanModal');
  if (!modal || !loan) return;


  const titleEl = modal.querySelector('.modal-t');
  if (titleEl) {
    titleEl.textContent = `${_L('ui_manage_personal_loan').replace('{loan}', loan.title || _L('ui_loans'))}`;
  }


  const loanSummaryLabels = modal.querySelectorAll('.loan-summary-item .lsi-label');
  if (loanSummaryLabels.length >= 4) {
    loanSummaryLabels[0].textContent = _L('ui_total');
    loanSummaryLabels[1].textContent = _L('ui_remaining');
    loanSummaryLabels[2].textContent = _L('ui_daily_payment');
    loanSummaryLabels[3].textContent = _L('ui_next_payment');
  }

  const partialPaymentLabel = modal.querySelector('.modal-option-group .modal-option-title');
  if (partialPaymentLabel) partialPaymentLabel.textContent = _L('ui_partial_payment');

  const partialPaymentBtn = modal.querySelector('.partial-payment-btn');
  if (partialPaymentBtn) partialPaymentBtn.textContent = _L('ui_pay');

  const payOffLoanBtn = modal.querySelector('#payOffLoanBtn');
  if (payOffLoanBtn) payOffLoanBtn.textContent = _L('ui_pay_off_loan');

  const warningTitle = modal.querySelector('.alert-warning .alert-title');
  if (warningTitle) warningTitle.textContent = _L('ui_warning');

  const warningMessage = modal.querySelector('.alert-warning .alert-message');
  if (warningMessage) warningMessage.innerHTML = _L('ui_loan_overdue_warning');


  const warningBox = modal.querySelector('.alert-box.alert-warning');
  if (warningBox) {
    const statusNum = Number(loan.status) || 0;
    if (statusNum === 1 || statusNum === 3) {
      warningBox.style.display = 'flex';
    } else {
      warningBox.style.display = 'none';
    }
  }


  const totalEl = modal.querySelector('.loan-summary-item:nth-child(1) .lsi-value-blue');
  if (totalEl) totalEl.textContent = formatCurrency(loan.amount || 0);


  const remaining = loan.remaining || (loan.amount - loan.paid) || 0;
  const remainingEl = modal.querySelector('.loan-summary-item:nth-child(2) .lsi-value');
  if (remainingEl) remainingEl.textContent = formatCurrency(Math.max(0, remaining));

  const dailyEl = modal.querySelector('.loan-summary-item:nth-child(3) .lsi-value');
  if (dailyEl) dailyEl.textContent = formatCurrency(loan.monthly || 0);

  const nextPaymentEl = modal.querySelector('.loan-summary-item:nth-child(4) .lsi-value');
  if (nextPaymentEl) {
    const { text, warn } = formatDue(loan.due_at || 0, loan.status || 0);
    nextPaymentEl.textContent = text;
    if (warn) {
      nextPaymentEl.classList.add('lsi-value-warning');
    } else {
      nextPaymentEl.classList.remove('lsi-value-warning');
    }
  }


  modal.setAttribute('data-loan-id', loan.id || '');
  modal.setAttribute('data-loan-data', JSON.stringify(loan));
}

$(document).on('click', '.manage-loan-btn', function () {
  const loanDataStr = this.getAttribute('data-loan-data');
  if (!loanDataStr) return;

  try {
    const loan = JSON.parse(loanDataStr);
    const m = document.getElementById('manageLoanModal');
    if (!m) return;


    populateLoanModal(loan);

    m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
    m.style.display = 'flex';
    setTimeout(() => m.classList.add('show'), 50);
  } catch (e) {
    console.error('Error parsing loan data:', e);
  }
});


$(document).on('click', '.partial-payment-btn', async function () {
  const modal = document.getElementById('manageLoanModal');
  if (!modal) return;

  const loanId = modal.getAttribute('data-loan-id');
  const inputEl = document.getElementById('partialPaymentAmount');
  if (!loanId || !inputEl) {
    return;
  }
  const paymentAmount = parseFloat(inputEl.value.replace(/[^\d.,]/g, '').replace(',', '.')) || 0;
  if (paymentAmount <= 0) {
    return;
  }


  const loanDataStr = modal.getAttribute('data-loan-data');
  if (loanDataStr) {
    try {
      const loan = JSON.parse(loanDataStr);
      const remaining = (loan.amount || 0) - (loan.paid || 0);
      if (paymentAmount > remaining) {
        inputEl.value = remaining;
        return;
      }
    } catch (e) {
      console.error('Error parsing loan data:', e);
    }
  }


  const btn = this;
  try {
    const finalAmount = parseFloat(inputEl.value.replace(/[^\d.,]/g, '').replace(',', '.')) || 0;

    const accountType = openedAccount;
    const isBusinessAccount = accountType === 'business';
    const isCustomAccount = accountType && accountType.startsWith('custom_');

    const response = await fetch(`https://${GetParentResourceName()}/partialPayment`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ loanId: parseInt(loanId), amount: finalAmount, accountType: openedAccount })
    });
    const data = await response.json();

    if (data.success) {

      const bankBalance = data.bankBalance || (data.result && data.result.bankBalance);
      if (bankBalance !== undefined && typeof bankBalance === 'number') {

        if (isBusinessAccount && societyData) {
          societyData.value = bankBalance;
        } else if (isCustomAccount) {
          const accountIdentifier = accountType.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            customAccount.balance = bankBalance;
          }

          if (accounts[accountType] && accounts[accountType].accountData) {
            accounts[accountType].accountData.balance = bankBalance;
          }
        } else {

          playerData.playerBankMoney = bankBalance;
        }
        updatePlayerMoney(bankBalance);
      } else {
        console.warn('Bank balance not found or invalid in response');
      }


      const transactions = data.transactions || (data.result && data.result.transactions);
      if (transactions) {
        const normalizedTxs = normalizeTransactionsPayload(transactions);
        setActiveTransactions(normalizedTxs);
      }


      const creditScore = data.creditScore || (data.result && data.result.creditScore);
      if (creditScore) {

        if (isBusinessAccount && societyData) {
          societyData.creditScore = creditScore;
        } else if (isCustomAccount) {
          const accountIdentifier = accountType.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            customAccount.creditScore = creditScore;
          }
        } else {

          playerData.creditScore = creditScore;
        }

        if (currentPage === 'loans') {
          renderCreditScoreChart();
          renderLoanPlans();
        }
      }


      applyCurrentAccountToUI();


      inputEl.value = '';


      await fetchAndRenderActiveLoans();


      modal.classList.remove('show');
      setTimeout(() => {
        modal.style.display = 'none';

        inputEl.value = '';
      }, 300);


      btn.disabled = false;
    }
  } catch (e) {
    btn.disabled = false;
  }
});


$(document).on('click', '#payOffLoanBtn', async function () {
  const modal = document.getElementById('manageLoanModal');
  if (!modal) return;

  const loanId = modal.getAttribute('data-loan-id');
  if (!loanId) {
    console.error('No loan ID found in modal');
    return;
  }


  const btn = this;

  try {

    const accountType = openedAccount;
    const isBusinessAccount = accountType === 'business';
    const isCustomAccount = accountType && accountType.startsWith('custom_');

    const response = await fetch(`https://${GetParentResourceName()}/payOffLoan`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ loanId: parseInt(loanId), accountType: openedAccount })
    });

    const data = await response.json();

    if (data.success) {

      const bankBalance = data.bankBalance || (data.result && data.result.bankBalance);
      if (bankBalance !== undefined && typeof bankBalance === 'number') {

        if (isBusinessAccount && societyData) {
          societyData.value = bankBalance;
        } else if (isCustomAccount) {
          const accountIdentifier = accountType.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            customAccount.balance = bankBalance;
          }

          if (accounts[accountType] && accounts[accountType].accountData) {
            accounts[accountType].accountData.balance = bankBalance;
          }
        } else {

          playerData.playerBankMoney = bankBalance;
        }
        updatePlayerMoney(bankBalance);
      } else {
        console.warn('Bank balance not found or invalid in response');
      }


      const transactions = data.transactions || (data.result && data.result.transactions);
      if (transactions) {
        const normalizedTxs = normalizeTransactionsPayload(transactions);
        setActiveTransactions(normalizedTxs);
      }


      const creditScore = data.creditScore || (data.result && data.result.creditScore);
      if (creditScore) {

        if (isBusinessAccount && societyData) {
          societyData.creditScore = creditScore;
        } else if (isCustomAccount) {
          const accountIdentifier = accountType.replace('custom_', '');
          const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
          if (customAccount) {
            customAccount.creditScore = creditScore;
          }
        } else {

          playerData.creditScore = creditScore;
        }

        if (currentPage === 'loans') {
          renderCreditScoreChart();
          renderLoanPlans();
        }
      }


      applyCurrentAccountToUI();


      const inputEl = document.getElementById('partialPaymentAmount');
      if (inputEl) inputEl.value = '';


      modal.classList.remove('show');
      setTimeout(() => {
        modal.style.display = 'none';

        if (inputEl) inputEl.value = '';
      }, 300);


      await fetchAndRenderActiveLoans();


      btn.disabled = false;
    }
  } catch (e) {
    btn.disabled = false;
  }
});

$(document).on('click', '#manageGoalButton', function () {
  const m = document.getElementById('manageGoalModal');
  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => m.classList.add('show'), 50);
});

$(document).on('click', '#accountSettingsButton', function (e) {

  const dropdown = document.getElementById('accountDropdownMenu');
  const arrow = document.querySelector('.dropdown-arrow');
  if (dropdown && dropdown.classList.contains('show')) {
    dropdown.classList.remove('show');
  }
  if (arrow && arrow.classList.contains('rotated')) {
    arrow.classList.remove('rotated');
  }


  let accountName = _L('ui_personal_account');
  let openingDate = 'N/A';
  let accountType = _L('ui_personal');

  if (openedAccount === 'business' && societyData) {
    accountName = societyData.society_name || societyData.society || _L('ui_business_account');
    openingDate = societyData.opening_date || 'N/A';
    accountType = _L('ui_business');
  } else if (openedAccount && openedAccount.startsWith('custom_')) {
    const accountIdentifier = openedAccount.replace('custom_', '');
    const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
    if (customAccount) {
      accountName = customAccount.account_name || customAccount.owner_name || _L('tx_custom_account');
      openingDate = customAccount.opening_date || 'N/A';
      accountType = _L('ui_shared');
    }
  } else {

    accountName = _L('ui_personal_account');
    openingDate = playerData?.opening_date || 'N/A';
    accountType = _L('ui_personal');
  }


  const accountNameInput = document.getElementById('account_name_input');
  const openingDateInput = document.getElementById('account_opening_date_input');
  const accountTypeInput = document.getElementById('account_type_input');
  const closeAccountSection = document.getElementById('close_account_section');
  const saveChangesBtn = document.getElementById('save_account_changes_btn');


  const modalTitle = document.querySelector('#accountSettingsModal .modal-t');
  if (modalTitle) modalTitle.textContent = _L('ui_account_settings');

  const labels = document.querySelectorAll('#accountSettingsModal .modal-option-title');
  const labelKeys = ['ui_account_name', 'ui_opening_date', 'ui_account_type', 'ui_account_status'];
  labels.forEach((label, index) => {
    if (labelKeys[index]) label.textContent = _L(labelKeys[index]);
  });


  if (saveChangesBtn) saveChangesBtn.textContent = _L('ui_save_changes');


  const accountStatusInput = document.querySelector('#accountSettingsModal input[value="Active"]');
  if (accountStatusInput) accountStatusInput.value = _L('ui_active');

  if (accountNameInput) accountNameInput.value = accountName;
  if (openingDateInput) openingDateInput.value = openingDate;
  if (accountTypeInput) accountTypeInput.value = accountType;


  const isCustomAccount = openedAccount && openedAccount.startsWith('custom_');


  if (accountNameInput) {
    if (isCustomAccount) {
      accountNameInput.removeAttribute('readonly');
      accountNameInput.style.backgroundColor = '';
      accountNameInput.style.color = '';
    } else {
      accountNameInput.setAttribute('readonly', 'readonly');
      accountNameInput.style.backgroundColor = '#202020';
      accountNameInput.style.color = '#b4b4b4';
    }
  }


  if (closeAccountSection) {
    if (isCustomAccount) {
      closeAccountSection.style.display = 'flex';

      const accountIdentifier = openedAccount.replace('custom_', '');
      const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
      const isOwner = customAccount && customAccount.is_owner;


      const alertTitle = closeAccountSection.querySelector('.alert-title');
      if (alertTitle) {
        alertTitle.textContent = isOwner ? _L('ui_close_account') : _L('ui_leave_account');
      }


      const alertMessage = closeAccountSection.querySelector('.alert-message');
      if (alertMessage) {
        if (isOwner) {
          alertMessage.textContent = _L('ui_close_account_warning');
        } else {
          alertMessage.textContent = _L('ui_leave_account_warning');
        }
      }


      const closeAccountBtn = closeAccountSection.querySelector('.close-account-btn');
      if (closeAccountBtn) {
        if (isOwner) {
          closeAccountBtn.textContent = _L('ui_close_account_btn');
        } else {
          closeAccountBtn.textContent = _L('ui_leave_account');
        }
      }
    } else {
      closeAccountSection.style.display = 'none';
    }
  }

  if (saveChangesBtn) {
    if (isCustomAccount) {
      saveChangesBtn.style.display = 'flex';
    } else {
      saveChangesBtn.style.display = 'none';
    }
  }

  const m = document.getElementById('accountSettingsModal');
  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => m.classList.add('show'), 50);
});


$(document).on('click', '.close-account-btn', async function (e) {
  e.stopPropagation();

  if (!openedAccount || !openedAccount.startsWith('custom_')) {
    return;
  }

  const accountIdentifier = openedAccount.replace('custom_', '');
  const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);

  if (!customAccount) {
    return;
  }

  const isOwner = customAccount.is_owner;
  const accountName = customAccount.account_name || customAccount.owner_name || 'this account';


  try {
    const res = await fetch(`https://${GetParentResourceName()}/getActiveLoans`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ accountType: openedAccount })
    });
    const data = await res.json();
    const accountLoans = Array.isArray(data.loans) ? data.loans : [];

    if (accountLoans.length > 0) {
      return;
    }
  } catch (error) {
    console.error('Error checking active loans:', error);

  }


  const accountBalance = toNumber(customAccount.balance) || 0;

  let confirmText = '';
  let buttonText = '';

  if (isOwner) {
    if (accountBalance > 0) {
      confirmText = `${_L('ui_confirm_close_account')}<span class="bold"> ${accountName}</span>?<br><br>${_L('ui_close_account_permanent')}<br><br><span class="bold" style="color: #ff6b6b;">${_L('ui_warning')}: ${_L('ui_account_has_balance')} ${formatCurrency(accountBalance)}. ${_L('ui_withdraw_before_close')}</span>`;
    } else {
      confirmText = `${_L('ui_confirm_close_account')}<span class="bold"> ${accountName}</span>?<br><br>${_L('ui_close_account_permanent')}`;
    }
    buttonText = _L('ui_close_account');
  } else {
    confirmText = `${_L('ui_confirm_leave_account')}<span class="bold"> ${accountName}</span>?<br><br>${_L('ui_leave_account_warning_full')}`;
    buttonText = _L('ui_leave_account');
  }

  openConfirmModal(
    confirmText,
    buttonText,
    'red',
    function () {

      const accountSettingsModal = document.getElementById('accountSettingsModal');
      if (accountSettingsModal) {
        accountSettingsModal.classList.remove('show');
        setTimeout(() => {
          accountSettingsModal.style.display = 'none';
        }, 300);
      }


      const endpoint = isOwner ? 'closeCustomAccount' : 'leaveCustomAccount';
      fetch(`https://${GetParentResourceName()}/${endpoint}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({
          accountIdentifier: accountIdentifier
        })
      })
        .then(r => r.json())
        .then(data => {
          if (data.success) {

            customAccountsData = customAccountsData.filter(acc => acc.account_identifier !== accountIdentifier);


            const accountKey = `custom_${accountIdentifier}`;
            if (accounts[accountKey]) {
              delete accounts[accountKey];
            }


            const dropdown = document.getElementById('accountDropdownMenu');
            if (dropdown) {
              const accountOption = dropdown.querySelector(`.account-option[data-account-identifier="${accountIdentifier}"]`);
              if (accountOption) {
                accountOption.remove();
              }
            }


            registerOrUpdateAccounts();


            selectAccount('personal');


            applyCurrentAccountToUI();
          }
        });
    }
  );
});


$(document).on('click', '#save_account_changes_btn', function (e) {
  e.stopPropagation();

  if (!openedAccount || !openedAccount.startsWith('custom_')) {
    return;
  }

  const accountIdentifier = openedAccount.replace('custom_', '');
  const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);

  if (!customAccount) {
    return;
  }

  const accountNameInput = document.getElementById('account_name_input');
  if (!accountNameInput) {
    return;
  }

  const newAccountName = accountNameInput.value.trim();

  if (!newAccountName || newAccountName.length === 0) {
    fetch(`https://${GetParentResourceName()}/SendNotification`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({
        localeKey: 'error_invalid_data'
      })
    });
    return;
  }


  if (newAccountName === (customAccount.account_name || customAccount.owner_name)) {
    const accountSettingsModal = document.getElementById('accountSettingsModal');
    if (accountSettingsModal) {
      accountSettingsModal.classList.remove('show');
      setTimeout(() => {
        accountSettingsModal.style.display = 'none';
      }, 300);
    }
    return;
  }


  fetch(`https://${GetParentResourceName()}/updateAccountName`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({
      accountIdentifier: accountIdentifier,
      accountName: newAccountName
    })
  })
    .then(r => r.json())
    .then(data => {
      if (data.success) {

        const accountIndex = customAccountsData.findIndex(acc => acc.account_identifier === accountIdentifier);
        if (accountIndex !== -1) {
          customAccountsData[accountIndex].account_name = newAccountName;
        }


        const accountKey = `custom_${accountIdentifier}`;
        if (accounts[accountKey]) {
          accounts[accountKey].account_name = newAccountName;
        }


        const dropdown = document.getElementById('accountDropdownMenu');
        if (dropdown) {
          const accountOption = dropdown.querySelector(`.account-option[data-account-identifier="${accountIdentifier}"]`);
          if (accountOption) {
            const accountNameSpan = accountOption.querySelector('.account-info .account-name');
            if (accountNameSpan) {
              accountNameSpan.textContent = newAccountName;
            }


            if (accountOption.hasAttribute('data-custom-account-name')) {
              accountOption.setAttribute('data-custom-account-name', newAccountName);
            }
          }


          setTimeout(() => reorganizeAccountDropdown(), 0);
        }


        if (openedAccount === accountKey) {
          const currentAccountName = document.querySelector('.account-current .account-info .account-name');
          if (currentAccountName) {
            currentAccountName.textContent = newAccountName;
          }
          applyCurrentAccountToUI();
        }


        const accountSettingsModal = document.getElementById('accountSettingsModal');
        if (accountSettingsModal) {
          accountSettingsModal.classList.remove('show');
          setTimeout(() => {
            accountSettingsModal.style.display = 'none';
          }, 300);
        }
      }
    });
});

$(document).on('click', '#createNewGoalButton', function () {
  const m = document.getElementById('createNewGoalModal');
  m.setAttribute('data-page', this.getAttribute('data-page') || currentPage || 'overview');
  m.style.display = 'flex';
  setTimeout(() => m.classList.add('show'), 50);

  validateCreateGoalButton();
});

$(document).on('click', '.copy-iban', function () {

  const ibanElement = document.getElementById('iban-value');
  if (!ibanElement) {
    return;
  }

  const currentIban = ibanElement.textContent.trim();

  if (!currentIban) {
    return;
  }


  const textArea = document.createElement('textarea');
  textArea.value = currentIban;
  textArea.style.position = 'fixed';
  textArea.style.left = '-999999px';
  textArea.style.top = '-999999px';
  document.body.appendChild(textArea);
  textArea.focus();
  textArea.select();

  try {
    const successful = document.execCommand('copy');
    showCopyFeedback(this, successful);
  } catch (err) {
    showCopyFeedback(this, false);
  } finally {
    document.body.removeChild(textArea);
  }
});


function showCopyFeedback(buttonElement, success) {
  const iconElement = buttonElement.querySelector('i');
  const originalClass = 'fa-solid fa-copy';
  const originalTitle = _L('ui_copy');
  const ibanCopyBtn = document.querySelector('.copy-iban');

  if (success) {
    ibanCopyBtn.dataset.tooltip = _L('ui_copy_success');
    updateCustomTooltipText(ibanCopyBtn, _L('ui_copy_success'));
    iconElement.className = 'fa-solid fa-check';
  }


  setTimeout(() => {
    ibanCopyBtn.dataset.tooltip = _L('ui_copy');
    updateCustomTooltipText(ibanCopyBtn, _L('ui_copy'));
    iconElement.className = originalClass;
    buttonElement.title = originalTitle;
  }, 2000);
}

$(document).on('click', '.edit-iban', function () {
  const ibanValueEl = document.querySelector('.iban');
  const ibanEditBtn = document.querySelector('.edit-iban');
  const buttonEl = this;
  const iconEl = buttonEl.querySelector('i');

  if (buttonEl.classList.contains('editing')) {
    ibanEditBtn.dataset.tooltip = _L('ui_edit');
    updateCustomTooltipText(ibanEditBtn, _L('ui_edit'));

    const inputEl = document.querySelector('.iban-input');
    if (inputEl) {
      const newIban = inputEl.value.trim().toUpperCase();
      let currentIban = 'N/A';
      if (currentAccountType === 'business') {
        currentIban = societyData?.iban || 'N/A';
      } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
        const accountIdentifier = currentAccountType.replace('custom_', '');
        const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
        currentIban = customAccount?.iban || 'N/A';
      } else {
        currentIban = playerData.playerIBAN || 'N/A';
      }

      if (newIban && newIban !== currentIban) {

        const confirmText = `${_L('ui_are_you_sure_iban_change')}<br>${_L('ui_price')}: <span class="bold">${formatCurrency(ibanChangeCost)}</span>`;

        openConfirmModal(
          confirmText,
          _L('ui_confirm'),
          'blue',
          function () {

            fetch(`https://${GetParentResourceName()}/updateIBAN`, {
              method: 'POST',
              headers: { 'Content-Type': 'application/json; charset=UTF-8' },
              body: JSON.stringify({ newIban, account: currentAccountType })
            })
              .then(r => r.json())
              .then(data => {
                if (data.success) {
                  if (currentAccountType === 'business') {
                    if (societyData) {
                      societyData.iban = newIban;
                    }
                  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
                    const accountIdentifier = currentAccountType.replace('custom_', '');
                    const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
                    if (customAccount) {
                      customAccount.iban = newIban;
                    }
                  } else {
                    playerData.playerIBAN = newIban;
                  }


                  if (data.transactions) {
                    const txs = normalizeTransactionsPayload(data.transactions);
                    setActiveTransactions(txs);
                    if (currentPage === 'overview') {
                      populateLastTransactions(txs);
                    }
                  }


                  if (data.bankMoney !== undefined) {
                    if (currentAccountType === 'business') {
                      societyData.value = data.bankMoney;
                    } else if (currentAccountType === 'savings') {
                      playerData.savings.balance = data.bankMoney;
                    } else {
                      playerData.playerBankMoney = data.bankMoney;
                    }
                    updatePlayerMoney(data.bankMoney);
                  }


                  ibanValueEl.textContent = newIban || 'N/A';
                  ibanValueEl.style.display = 'flex';
                  inputEl.remove();
                } else {

                  ibanValueEl.textContent = currentIban;
                  ibanValueEl.style.display = 'flex';
                  inputEl.remove();
                }


                iconEl.className = 'fa-solid fa-pencil';
                buttonEl.classList.remove('editing');
              })
              .catch(error => {

                ibanValueEl.textContent = currentIban;
                ibanValueEl.style.display = 'flex';
                inputEl.remove();


                iconEl.className = 'fa-solid fa-pencil';
                buttonEl.classList.remove('editing');
              });
          }
        );


        return;
      } else {

        ibanValueEl.textContent = currentIban;
        ibanValueEl.style.display = 'flex';
        inputEl.remove();
      }
    }


    iconEl.className = 'fa-solid fa-pencil';
    buttonEl.classList.remove('editing');

  } else {
    ibanEditBtn.dataset.tooltip = _L('ui_confirm');
    updateCustomTooltipText(ibanEditBtn, _L('ui_confirm'));

    const currentIban = ibanValueEl.textContent;


    const computedStyle = window.getComputedStyle(ibanValueEl);


    const inputEl = document.createElement('input');
    inputEl.type = 'text';
    inputEl.value = currentIban;
    inputEl.className = 'iban-input';


    inputEl.style.color = computedStyle.color;
    inputEl.style.fontSize = computedStyle.fontSize;
    inputEl.style.fontFamily = computedStyle.fontFamily;
    inputEl.style.fontWeight = computedStyle.fontWeight;
    inputEl.style.lineHeight = computedStyle.lineHeight;
    inputEl.style.letterSpacing = computedStyle.letterSpacing;
    inputEl.style.textAlign = computedStyle.textAlign;
    inputEl.style.height = `${ibanValueEl.offsetHeight}px`;


    inputEl.addEventListener('input', function () {
      this.value = this.value.toUpperCase();
    });


    ibanValueEl.style.display = 'none';
    ibanValueEl.parentNode.insertBefore(inputEl, ibanValueEl.nextSibling);
    inputEl.focus();
    inputEl.select();


    iconEl.className = 'fa-solid fa-check';
    buttonEl.classList.add('editing');


    inputEl.addEventListener('keydown', function (e) {
      if (e.key === 'Enter') {
        buttonEl.click();
      }
    });
  }
});

$(document).on('click', '#card-button-daily-limit .card-button', function () {
  const dailyLimitValueEl = document.querySelector('.card-daily-limit');
  const cardLimitLeftEl = document.querySelector('.card-limit-left');
  const buttonEl = this;
  const iconEl = buttonEl.querySelector('i');


  var cardsInfo = getCurrentCards();
  if (!cardsInfo || cardsInfo.length === 0 || selectedCardIndex < 0 || selectedCardIndex >= cardsInfo.length) {
    return;
  }
  const currentCard = cardsInfo[selectedCardIndex];

  if (buttonEl.classList.contains('editing')) {
    buttonEl.dataset.tooltip = _L('ui_edit');
    updateCustomTooltipText(buttonEl, _L('ui_edit'));

    const inputEl = document.querySelector('.daily-limit-input');
    if (inputEl) {
      let newLimit = parseInt(inputEl.value.replace(/[^0-9]/g, ''), 10) || 0;
      const currentLimit = currentCard.daily_limit || 0;


      const maxLimit = cardsConfig.maxDailyLimit || 999999999;
      if (newLimit > maxLimit) {
        newLimit = maxLimit;
      }

      if (newLimit !== currentLimit && newLimit >= 0) {

        const confirmText = _L('ui_are_you_sure_daily_limit_change');

        openConfirmModal(
          confirmText,
          _L('ui_confirm'),
          'blue',
          function () {

            fetch(`https://${GetParentResourceName()}/updateDailyLimit`, {
              method: 'POST',
              headers: { 'Content-Type': 'application/json; charset=UTF-8' },
              body: JSON.stringify({
                newLimit: newLimit,
                cardInfo: currentCard,
                account: currentAccountType,
                accountType: currentAccountType
              })
            })
              .then(r => r.json())
              .then(data => {
                if (data.success) {

                  currentCard.daily_limit = newLimit;
                  updateCardsData(data.cardsData);


                  dailyLimitValueEl.textContent = formatCurrency(newLimit);
                  dailyLimitValueEl.style.display = 'flex';
                  inputEl.remove();


                  const todaySpent = currentCard.today_spent || 0;
                  cardLimitLeftEl.textContent = '(' + formatCurrency(newLimit - todaySpent) + ')';
                  cardLimitLeftEl.style.display = '';
                } else {

                  dailyLimitValueEl.textContent = formatCurrency(currentLimit);
                  dailyLimitValueEl.style.display = 'flex';
                  inputEl.remove();
                  cardLimitLeftEl.style.display = '';
                }


                iconEl.className = 'fa-solid fa-pencil';
                buttonEl.classList.remove('editing');
              })
              .catch(error => {

                dailyLimitValueEl.textContent = formatCurrency(currentLimit);
                dailyLimitValueEl.style.display = 'flex';
                inputEl.remove();
                cardLimitLeftEl.style.display = '';


                iconEl.className = 'fa-solid fa-pencil';
                buttonEl.classList.remove('editing');
              });
          }
        );


        return;
      } else {

        dailyLimitValueEl.textContent = formatCurrency(currentLimit);
        dailyLimitValueEl.style.display = 'flex';
        inputEl.remove();
        cardLimitLeftEl.style.display = '';
      }
    }


    iconEl.className = 'fa-solid fa-pencil';
    buttonEl.classList.remove('editing');

  } else {
    buttonEl.dataset.tooltip = _L('ui_confirm');
    updateCustomTooltipText(buttonEl, _L('ui_confirm'));

    const currentLimit = currentCard.daily_limit || 0;


    const computedStyle = window.getComputedStyle(dailyLimitValueEl);


    const formatNumberOnly = (num) => {
      const locale = currencyLocaleMap[currentCurrency] || 'en-US';
      return new Intl.NumberFormat(locale, {
        style: 'decimal',
        minimumFractionDigits: 0,
        maximumFractionDigits: 0
      }).format(num);
    };


    const inputEl = document.createElement('input');
    inputEl.type = 'text';
    inputEl.value = formatNumberOnly(currentLimit);
    inputEl.className = 'daily-limit-input';


    inputEl.style.color = computedStyle.color;
    inputEl.style.fontSize = computedStyle.fontSize;
    inputEl.style.fontFamily = computedStyle.fontFamily;
    inputEl.style.fontWeight = computedStyle.fontWeight;
    inputEl.style.lineHeight = computedStyle.lineHeight;
    inputEl.style.letterSpacing = computedStyle.letterSpacing;
    inputEl.style.textAlign = computedStyle.textAlign;
    inputEl.style.height = `${dailyLimitValueEl.offsetHeight}px`;


    inputEl.addEventListener('input', function () {

      const cursorPos = this.selectionStart;
      const oldLength = this.value.length;


      const digits = this.value.replace(/[^0-9]/g, '');


      let numValue = digits ? parseInt(digits, 10) : 0;
      const maxLimit = cardsConfig.maxDailyLimit || 999999999;
      if (numValue > maxLimit) {
        numValue = maxLimit;
      }


      const formatted = numValue > 0 ? formatNumberOnly(numValue) : '';


      this.value = formatted;


      const newLength = this.value.length;
      const diff = newLength - oldLength;
      const newCursorPos = Math.max(0, cursorPos + diff);
      this.setSelectionRange(newCursorPos, newCursorPos);
    });


    dailyLimitValueEl.style.display = 'none';
    cardLimitLeftEl.style.display = 'none';
    dailyLimitValueEl.parentNode.insertBefore(inputEl, dailyLimitValueEl.nextSibling);
    inputEl.focus();
    inputEl.select();


    iconEl.className = 'fa-solid fa-check';
    buttonEl.classList.add('editing');


    inputEl.addEventListener('keydown', function (e) {
      if (e.key === 'Enter') {
        buttonEl.click();
      }
    });
  }
});


function updateCardsData(cardsData) {
  if (!cardsData) return;

  let parsedCards;
  if (typeof cardsData === 'string') {
    try {
      parsedCards = JSON.parse(cardsData);
    } catch (e) {
      return;
    }
  } else {
    parsedCards = cardsData;
  }

  if (currentAccountType === 'personal') {
    playerData.playerPIN = parsedCards;
  } else if (currentAccountType === 'business') {
    businessCardsData = parsedCards;
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const accountIdentifier = currentAccountType.replace('custom_', '');
    customAccountCardsData[accountIdentifier] = parsedCards;
  }
}


function getCurrentCards() {
  var cardsInfo = [];
  if (currentAccountType === 'personal') {
    if (typeof playerData.playerPIN === 'string') {
      cardsInfo = JSON.parse(playerData.playerPIN);
    } else if (playerData.playerPIN) {
      cardsInfo = playerData.playerPIN;
    }
  } else if (currentAccountType === 'business') {
    if (typeof businessCardsData === 'string') {
      try {
        cardsInfo = JSON.parse(businessCardsData);
      } catch (e) {
        cardsInfo = [];
      }
    } else {
      cardsInfo = businessCardsData || [];
    }
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const accountIdentifier = currentAccountType.replace('custom_', '');
    cardsInfo = customAccountCardsData[accountIdentifier] || [];
  } else if (currentAccountType === 'card') {

    if (typeof playerData.playerPIN === 'string') {
      try {
        cardsInfo = JSON.parse(playerData.playerPIN);
      } catch (e) {
        cardsInfo = [];
      }
    } else if (playerData.playerPIN) {
      cardsInfo = playerData.playerPIN;
    }
  }

  if (!Array.isArray(cardsInfo)) {
    cardsInfo = cardsInfo ? [cardsInfo] : [];
  }
  return cardsInfo;
}


$(document).on('click', '.show-pin', function () {
  const pinValueEl = document.querySelector('.pin-value');
  const iconEl = this.querySelector('i');
  const pinShowBtn = document.querySelector('.show-pin');


  var cardsInfo = getCurrentCards();


  var cardIndex = selectedCardIndex >= 0 ? selectedCardIndex : (cardsInfo.length > 0 ? 0 : -1);

  if (cardsInfo.length === 0 || cardIndex < 0 || cardIndex >= cardsInfo.length) {
    return;
  }

  const currentCard = cardsInfo[cardIndex];

  if (iconEl && iconEl.classList.contains('fa-eye')) {

    if (currentCard && currentCard.pincode) {
      pinShowBtn.dataset.tooltip = _L('ui_hide');
      updateCustomTooltipText(pinShowBtn, _L('ui_hide'));
      pinValueEl.textContent = currentCard.pincode;
    } else {
      pinShowBtn.dataset.tooltip = _L('ui_show');
      updateCustomTooltipText(pinShowBtn, _L('ui_show'));
      pinValueEl.textContent = _L('ui_not_set');
    }
    iconEl.className = 'fa-solid fa-eye-slash';
  } else if (iconEl) {

    pinShowBtn.dataset.tooltip = _L('ui_show');
    updateCustomTooltipText(pinShowBtn, _L('ui_show'));
    pinValueEl.textContent = '●●●●';
    iconEl.className = 'fa-solid fa-eye';
  }
});

$(document).on('click', '.edit-pin', function () {
  const pinValueEl = document.querySelector('.pin-value');
  const pinEditBtn = document.querySelector('.edit-pin');
  const buttonEl = this;
  const iconEl = buttonEl.querySelector('i');
  const showPinBtn = document.querySelector('.show-pin');
  const showPinIcon = showPinBtn ? showPinBtn.querySelector('i') : null;

  if (buttonEl.classList.contains('editing')) {
    pinEditBtn.dataset.tooltip = _L('ui_edit');
    updateCustomTooltipText(pinEditBtn, _L('ui_edit'));

    const inputEl = document.querySelector('.pin-input');
    if (inputEl) {

      let newPin = inputEl.dataset.actualValue || inputEl.value.trim();

      newPin = newPin.replace(/\D/g, '').slice(0, 4);
      if (newPin && newPin.length === 4 && /^\d{4}$/.test(newPin)) {

        var cardsInfo = getCurrentCards();
        if (cardsInfo.length === 0 || selectedCardIndex < 0 || selectedCardIndex >= cardsInfo.length) {
          return;
        }
        const currentCard = cardsInfo[selectedCardIndex];
        const currentPin = currentCard.pincode || '----';


        if (newPin === currentPin) {

          const wasVisible = buttonEl.dataset.pinWasVisible === 'true';
          if (wasVisible) {
            pinValueEl.textContent = currentPin;
            if (showPinIcon) {
              showPinIcon.className = 'fa-solid fa-eye-slash';
            }
          } else {
            pinValueEl.textContent = '●●●●';
            if (showPinIcon) {
              showPinIcon.className = 'fa-solid fa-eye';
            }
          }
          pinValueEl.style.display = 'flex';
          inputEl.remove();
          if (iconEl) {
            iconEl.className = 'fa-solid fa-pencil';
          }
          buttonEl.classList.remove('editing');
          return;
        }


        const confirmText = `${_L('ui_are_you_sure_pin_change')}<br>${_L('ui_price')}: <span class="bold">${formatCurrency(pinChangeCost)}</span>`;

        openConfirmModal(
          confirmText,
          _L('ui_confirm'),
          'blue',
          function () {

            fetch(`https://${GetParentResourceName()}/updatePIN`, {
              method: 'POST',
              headers: { 'Content-Type': 'application/json; charset=UTF-8' },
              body: JSON.stringify({
                cardInfo: currentCard,
                newPin: newPin,
                accountType: currentAccountType
              })
            })
              .then(r => r.json())
              .then(data => {
                if (data.success) {

                  if (currentAccountType === 'personal') {
                    playerData.playerPIN = data.cardsData;
                  } else if (currentAccountType === 'business') {
                    businessCardsData = data.cardsData;

                    setCardsInfo();
                  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {

                    const accountIdentifier = currentAccountType.replace('custom_', '');
                    try {
                      const updatedCards = typeof data.cardsData === 'string'
                        ? JSON.parse(data.cardsData)
                        : data.cardsData;
                      customAccountCardsData[accountIdentifier] = updatedCards;

                      if (accounts[currentAccountType]) {
                        accounts[currentAccountType].accountData.balance = data.bankMoney;
                      }

                      if (customAccountsData && customAccountsData[accountIdentifier]) {
                        customAccountsData[accountIdentifier].balance = data.bankMoney;
                      }
                      setCardsInfo();
                    } catch (e) {
                      console.error('[updatePIN] Error parsing custom account cards:', e);
                    }
                  }

                  const txs = normalizeTransactionsPayload(data.transactions);
                  setActiveTransactions(txs);


                  if (currentAccountType === 'personal' || currentAccountType === 'business') {
                    updatePlayerMoney(data.bankMoney);
                  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {

                    const accountKey = currentAccountType;
                    const account = accounts[accountKey];
                    if (account) {
                      account.accountData.balance = data.bankMoney;
                      if (document.querySelector('.balance-value')) {
                        $('.balance-value').text(formatCurrency(data.bankMoney || 0));
                      }
                    }
                  }

                  if (currentPage === 'overview') {
                    populateLastTransactions(txs);
                  }
                }


                const wasVisible = buttonEl.dataset.pinWasVisible === 'true';
                if (wasVisible) {

                  pinValueEl.textContent = newPin;
                  if (showPinIcon) {
                    showPinIcon.className = 'fa-solid fa-eye-slash';
                  }
                } else {

                  pinValueEl.textContent = '●●●●';
                  if (showPinIcon) {
                    showPinIcon.className = 'fa-solid fa-eye';
                  }
                }
                pinValueEl.style.display = 'flex';
                inputEl.remove();


                if (iconEl) {
                  iconEl.className = 'fa-solid fa-pencil';
                }
                buttonEl.classList.remove('editing');
              })
              .catch(error => {

                const wasVisible = buttonEl.dataset.pinWasVisible === 'true';
                var cardsInfo = getCurrentCards();
                if (cardsInfo.length > 0 && selectedCardIndex >= 0 && selectedCardIndex < cardsInfo.length) {
                  const currentCard = cardsInfo[selectedCardIndex];
                  if (wasVisible) {
                    pinValueEl.textContent = currentCard.pincode || '----';
                  } else {
                    pinValueEl.textContent = '●●●●';
                  }
                } else {
                  pinValueEl.textContent = wasVisible ? '----' : '●●●●';
                }
                pinValueEl.style.display = 'flex';
                inputEl.remove();
                if (showPinIcon) {
                  showPinIcon.className = wasVisible ? 'fa-solid fa-eye-slash' : 'fa-solid fa-eye';
                }


                if (iconEl) {
                  iconEl.className = 'fa-solid fa-pencil';
                }
                buttonEl.classList.remove('editing');
              });
          }
        );


        return;
      } else {

        const wasVisible = buttonEl.dataset.pinWasVisible === 'true';
        var cardsInfo = getCurrentCards();
        if (cardsInfo.length > 0 && selectedCardIndex >= 0 && selectedCardIndex < cardsInfo.length) {
          const currentCard = cardsInfo[selectedCardIndex];
          if (wasVisible) {
            pinValueEl.textContent = currentCard.pincode || '----';
          } else {
            pinValueEl.textContent = '●●●●';
          }
        } else {
          pinValueEl.textContent = wasVisible ? '----' : '●●●●';
        }
        pinValueEl.style.display = 'flex';
        inputEl.remove();
        if (showPinIcon) {
          showPinIcon.className = wasVisible ? 'fa-solid fa-eye-slash' : 'fa-solid fa-eye';
        }
      }
    }


    if (iconEl) {
      iconEl.className = 'fa-solid fa-pencil';
    }
    buttonEl.classList.remove('editing');

  } else {
    pinEditBtn.dataset.tooltip = _L('ui_confirm');
    updateCustomTooltipText(pinEditBtn, _L('ui_confirm'));

    var cardsInfo = getCurrentCards();
    if (cardsInfo.length === 0 || selectedCardIndex < 0 || selectedCardIndex >= cardsInfo.length) {
      return;
    }
    const currentCard = cardsInfo[selectedCardIndex];
    const currentPin = currentCard.pincode || '----';


    const showPinIcon = showPinBtn ? showPinBtn.querySelector('i') : null;
    const isPinVisible = showPinIcon && showPinIcon.classList.contains('fa-eye-slash');


    buttonEl.dataset.pinWasVisible = isPinVisible ? 'true' : 'false';


    const computedStyle = window.getComputedStyle(pinValueEl);


    const inputEl = document.createElement('input');
    inputEl.type = 'text';
    inputEl.value = currentPin;
    inputEl.className = 'pin-input';
    inputEl.maxLength = 4;


    let actualValue = currentPin === '----' ? '' : currentPin;


    const updateInputDisplay = function () {
      const isVisible = showPinIcon && showPinIcon.classList.contains('fa-eye-slash');

      inputEl.dataset.actualValue = actualValue;
      if (isVisible) {

        inputEl.value = actualValue;
      } else {

        inputEl.value = '●'.repeat(actualValue.length);
      }
    };


    updateInputDisplay();


    inputEl.style.color = computedStyle.color;
    inputEl.style.fontSize = computedStyle.fontSize;
    inputEl.style.fontFamily = computedStyle.fontFamily;
    inputEl.style.fontWeight = computedStyle.fontWeight;
    inputEl.style.lineHeight = computedStyle.lineHeight;
    inputEl.style.letterSpacing = computedStyle.letterSpacing;
    inputEl.style.textAlign = computedStyle.textAlign;
    inputEl.style.height = `${pinValueEl.offsetHeight}px`;


    inputEl.addEventListener('beforeinput', function (e) {
      const isVisible = showPinIcon && showPinIcon.classList.contains('fa-eye-slash');


      if (!isVisible && e.inputType === 'insertText') {
        e.preventDefault();
        const char = e.data;

        if (char && /^\d$/.test(char)) {
          const selectionStart = this.selectionStart || 0;
          const selectionEnd = this.selectionEnd || 0;
          const hasSelection = selectionStart !== selectionEnd;


          const actualSelectionStart = Math.min(selectionStart, actualValue.length);
          const actualSelectionEnd = Math.min(selectionEnd, actualValue.length);

          if (hasSelection) {

            actualValue = actualValue.slice(0, actualSelectionStart) + char + actualValue.slice(actualSelectionEnd);

            if (actualValue.length > 4) {
              actualValue = actualValue.slice(0, 4);
            }
          } else {

            if (actualValue.length < 4) {

              actualValue = actualValue.slice(0, actualSelectionStart) + char + actualValue.slice(actualSelectionStart);
            } else if (actualSelectionStart < 4) {

              actualValue = actualValue.slice(0, actualSelectionStart) + char + actualValue.slice(actualSelectionStart + 1);
            }
          }

          updateInputDisplay();

          setTimeout(() => {
            const newCursorPos = Math.min(actualSelectionStart + 1, actualValue.length);
            inputEl.setSelectionRange(newCursorPos, newCursorPos);
          }, 0);
        }
        return;
      }


      if (!isVisible && (e.inputType === 'deleteContentBackward' || e.inputType === 'deleteContentForward')) {
        e.preventDefault();
        const selectionStart = this.selectionStart || 0;
        const selectionEnd = this.selectionEnd || 0;
        const hasSelection = selectionStart !== selectionEnd;


        const actualSelectionStart = Math.min(selectionStart, actualValue.length);
        const actualSelectionEnd = Math.min(selectionEnd, actualValue.length);

        if (hasSelection) {

          actualValue = actualValue.slice(0, actualSelectionStart) + actualValue.slice(actualSelectionEnd);
        } else {

          const cursorPos = actualSelectionStart;
          if (e.inputType === 'deleteContentBackward' && cursorPos > 0) {

            actualValue = actualValue.slice(0, cursorPos - 1) + actualValue.slice(cursorPos);
          } else if (e.inputType === 'deleteContentForward' && cursorPos < actualValue.length) {

            actualValue = actualValue.slice(0, cursorPos) + actualValue.slice(cursorPos + 1);
          }
        }

        updateInputDisplay();
        setTimeout(() => {

          const newCursorPos = hasSelection ? actualSelectionStart :
            (e.inputType === 'deleteContentBackward' ? Math.max(0, actualSelectionStart - 1) : actualSelectionStart);
          this.setSelectionRange(newCursorPos, newCursorPos);
        }, 0);
        return;
      }
    });


    inputEl.addEventListener('input', function (e) {
      const isVisible = showPinIcon && showPinIcon.classList.contains('fa-eye-slash');


      if (isVisible) {

        let newValue = this.value.replace(/[^0-9]/g, '');
        if (newValue.length > 4) {
          newValue = newValue.slice(0, 4);
        }


        actualValue = newValue;
        updateInputDisplay();
      }
    });


    inputEl.addEventListener('keydown', function (e) {
      const isVisible = showPinIcon && showPinIcon.classList.contains('fa-eye-slash');


      if (e.ctrlKey || e.metaKey) {

        return;
      }


      if (!isVisible && e.key.length === 1 && !/^\d$/.test(e.key) && !['Backspace', 'Delete', 'ArrowLeft', 'ArrowRight', 'Tab', 'Home', 'End'].includes(e.key)) {
        e.preventDefault();
      }
    });


    pinValueEl.style.display = 'none';
    pinValueEl.parentNode.insertBefore(inputEl, pinValueEl.nextSibling);
    inputEl.focus();
    inputEl.select();


    if (iconEl) {
      iconEl.className = 'fa-solid fa-check';
    }
    buttonEl.classList.add('editing');


    inputEl._updateDisplay = updateInputDisplay;


    inputEl.addEventListener('keydown', function (e) {
      if (e.key === 'Enter') {

        inputEl.value = actualValue;
        buttonEl.click();
      }
    });


    if (showPinBtn) {

      const toggleHandler = function () {

        setTimeout(() => {
          if (inputEl._updateDisplay) {
            const cursorPos = inputEl.selectionStart || 0;
            inputEl._updateDisplay();

            inputEl.focus();
            inputEl.setSelectionRange(cursorPos, cursorPos);
          }
        }, 50);
      };
      showPinBtn.addEventListener('click', toggleHandler);


      inputEl._toggleHandler = toggleHandler;
    }
  }
});

function reorganizeAccountDropdown() {
  const dropdown = document.getElementById('accountDropdownMenu');
  const container = dropdown ? dropdown.closest('.account-dropdown-container') : null;
  if (!dropdown || !container) return;


  const existingRows = container.querySelectorAll('.account-dropdown-row');
  existingRows.forEach(row => row.remove());


  const allOptions = Array.from(dropdown.querySelectorAll('.account-option:not(.create-new-option)'));
  const createButton = dropdown.querySelector('.create-new-option');


  const hasValidSocietyData = societyData &&
    Object.keys(societyData).length > 0 &&
    (societyData.society || societyData.society_name || societyData.pincode || societyData.value !== undefined);


  allOptions.forEach(opt => {
    const isBusinessAccount = opt.getAttribute('onclick') === "selectAccount('business')";
    if (isBusinessAccount && !hasValidSocietyData) {

      opt.style.display = 'none';
    } else {
      opt.style.display = 'flex';
    }
  });


  const visibleOptions = allOptions.filter(opt => {

    const style = window.getComputedStyle(opt);
    const isHiddenByOtherCode = style.display === 'none';

    return !isHiddenByOtherCode;
  });


  const totalItems = visibleOptions.length + (createButton ? 1 : 0);
  const itemsPerRow = 4;


  if (totalItems <= itemsPerRow) {

    visibleOptions.forEach(opt => {
      opt.style.display = 'flex';
    });
    if (createButton) {
      createButton.style.display = 'flex';
    }
    return;
  }


  visibleOptions.slice(0, itemsPerRow).forEach(opt => {
    opt.style.display = 'flex';
  });


  visibleOptions.slice(itemsPerRow).forEach(opt => {
    opt.style.display = 'none';
  });


  if (createButton) {
    createButton.style.display = 'none';
  }


  const remainingAccounts = visibleOptions.slice(itemsPerRow);


  const rows = [];


  for (let i = 0; i < remainingAccounts.length; i += itemsPerRow) {
    const rowItems = remainingAccounts.slice(i, i + itemsPerRow);
    rows.push(rowItems);
  }


  if (createButton) {
    if (rows.length === 0) {

      rows.push([createButton]);
    } else {
      const lastRow = rows[rows.length - 1];
      if (lastRow.length < itemsPerRow) {

        lastRow.push(createButton);
      } else {

        rows.push([createButton]);
      }
    }
  }


  const createdRows = [];


  rows.forEach((rowItems, index) => {


    const rowDiv = document.createElement('div');
    rowDiv.className = 'account-dropdown-row';
    rowDiv.setAttribute('data-row-index', index);


    rowItems.forEach(originalItem => {
      const clonedItem = originalItem.cloneNode(true);


      const onclick = originalItem.getAttribute('onclick');
      if (onclick) {
        clonedItem.setAttribute('onclick', onclick);
      }


      const dataAttr = originalItem.getAttribute('data-account-identifier');
      if (dataAttr) {
        clonedItem.setAttribute('data-account-identifier', dataAttr);
      }


      clonedItem.className = originalItem.className;


      clonedItem.style.display = 'flex';


      if (originalItem.classList.contains('create-new-option')) {

        if (onclick) {
          clonedItem.setAttribute('onclick', onclick);
        }
      } else {

        clonedItem.removeAttribute('onclick');


        clonedItem.addEventListener('click', function (e) {
          e.stopPropagation();


          if (onclick) {

            const match = onclick.match(/(\w+)\(['"]([^'"]+)['"]\)/);
            if (match) {
              const funcName = match[1];
              const arg = match[2];
              if (window[funcName]) {
                window[funcName](arg);
              }
            }
          }
        });
      }

      rowDiv.appendChild(clonedItem);
    });


    container.appendChild(rowDiv);


    createdRows.push({ rowDiv, index });


    const syncVisibility = () => {
      if (dropdown.classList.contains('show')) {
        rowDiv.classList.add('show');
      } else {
        rowDiv.classList.remove('show');
      }
    };


    syncVisibility();


    const observer = new MutationObserver(syncVisibility);
    observer.observe(dropdown, {
      attributes: true,
      attributeFilter: ['class']
    });
  });


  if (createdRows.length > 0) {
    requestAnimationFrame(() => {

      const accountCurrent = container.querySelector('.account-current');
      const accountCurrentHeight = accountCurrent ? accountCurrent.offsetHeight : 0;
      const dropdownMarginTop = 4;
      const topPosition = accountCurrentHeight + dropdownMarginTop;


      const dropdownRect = dropdown.getBoundingClientRect();
      const dropdownWidth = dropdownRect.width || dropdown.offsetWidth;
      const gap = 8;
      const estimatedRowWidth = dropdownWidth;


      createdRows.forEach(({ rowDiv, index }) => {
        rowDiv.style.top = `${topPosition}px`;


        let leftPosition = dropdownWidth + gap;


        if (index > 0) {
          leftPosition += index * (estimatedRowWidth + gap);
        }

        rowDiv.style.left = `${leftPosition}px`;
      });
    });
  }
}


function syncAccountSelection() {
  const dropdown = document.getElementById('accountDropdownMenu');
  if (!dropdown) return;

  const container = dropdown.closest('.account-dropdown-container');
  if (!container) return;


  const selectedInMain = dropdown.querySelector('.account-option.selected');
  if (!selectedInMain) return;


  let selectedIdentifier = selectedInMain.getAttribute('onclick');
  if (!selectedIdentifier) {
    selectedIdentifier = selectedInMain.getAttribute('data-account-identifier');
    if (selectedIdentifier) {
      selectedIdentifier = `selectAccount('custom_${selectedIdentifier}')`;
    }
  }

  if (!selectedIdentifier) return;


  const match = selectedIdentifier.match(/selectAccount\(['"]([^'"]+)['"]\)/);
  const accountType = match ? match[1] : null;
  if (!accountType) return;


  const allRows = container.querySelectorAll('.account-dropdown-row');
  allRows.forEach(row => {
    row.querySelectorAll('.account-option').forEach(opt => {
      const optOnclick = opt.getAttribute('onclick');
      const optDataId = opt.getAttribute('data-account-identifier');
      let optAccountType = null;

      if (optOnclick) {
        const optMatch = optOnclick.match(/selectAccount\(['"]([^'"]+)['"]\)/);
        optAccountType = optMatch ? optMatch[1] : null;
      } else if (optDataId) {
        optAccountType = `custom_${optDataId}`;
      }

      if (optAccountType === accountType) {
        opt.classList.add('selected');

        if (!opt.querySelector('.fa-check')) {
          const checkIcon = document.createElement('i');
          checkIcon.className = 'fa-solid fa-check';
          opt.appendChild(checkIcon);
        }
      } else {
        opt.classList.remove('selected');
        const checkIcon = opt.querySelector('.fa-check');
        if (checkIcon) {
          checkIcon.remove();
        }
      }
    });
  });


  allRows.forEach(row => {
    const selectedInRow = row.querySelector('.account-option.selected');
    if (selectedInRow) {
      const rowOnclick = selectedInRow.getAttribute('onclick');
      const rowDataId = selectedInRow.getAttribute('data-account-identifier');
      let rowAccountType = null;

      if (rowOnclick) {
        const rowMatch = rowOnclick.match(/selectAccount\(['"]([^'"]+)['"]\)/);
        rowAccountType = rowMatch ? rowMatch[1] : null;
      } else if (rowDataId) {
        rowAccountType = `custom_${rowDataId}`;
      }

      if (rowAccountType) {

        dropdown.querySelectorAll('.account-option').forEach(opt => {
          const optOnclick = opt.getAttribute('onclick');
          const optDataId = opt.getAttribute('data-account-identifier');
          let optAccountType = null;

          if (optOnclick) {
            const optMatch = optOnclick.match(/selectAccount\(['"]([^'"]+)['"]\)/);
            optAccountType = optMatch ? optMatch[1] : null;
          } else if (optDataId) {
            optAccountType = `custom_${optDataId}`;
          }

          if (optAccountType === rowAccountType) {
            opt.classList.add('selected');
            if (!opt.querySelector('.fa-check')) {
              const checkIcon = document.createElement('i');
              checkIcon.className = 'fa-solid fa-check';
              opt.appendChild(checkIcon);
            }
          } else {
            opt.classList.remove('selected');
            const checkIcon = opt.querySelector('.fa-check');
            if (checkIcon) {
              checkIcon.remove();
            }
          }
        });
      }
    }
  });
}

function toggleAccountDropdown() {
  const dropdown = document.getElementById('accountDropdownMenu');
  const arrow = document.querySelector('.dropdown-arrow');
  const container = dropdown ? dropdown.closest('.account-dropdown-container') : null;

  if (dropdown && arrow) {
    const isShowing = dropdown.classList.contains('show');


    if (!isShowing) {

      reorganizeAccountDropdown();


      requestAnimationFrame(() => {
        dropdown.classList.add('show');
        arrow.classList.add('rotated');


        if (container) {
          const allRows = container.querySelectorAll('.account-dropdown-row');
          allRows.forEach(row => {
            row.classList.add('show');
          });
        }
      });
    } else {

      dropdown.classList.remove('show');
      arrow.classList.remove('rotated');


      if (container) {
        const allRows = container.querySelectorAll('.account-dropdown-row');
        allRows.forEach(row => {
          row.classList.remove('show');
        });
      }
    }
  }
}


window.toggleAccountDropdown = toggleAccountDropdown;

function maskCardNumber(cardNumber) {

  const cardStr = cardNumber.toString().replace(/\s/g, '');
  if (cardStr.length <= 4) {
    return cardStr;
  }

  const last4 = cardStr.slice(-4);

  const masked = '*'.repeat(Math.max(0, cardStr.length - 4));
  const maskedWithLast4 = masked + last4;


  return maskedWithLast4.match(/.{1,4}/g).join(' ');
}


function updateLastVisibleRowBorderRadius() {
  const tableBody = document.querySelector('.users-table-body');
  if (!tableBody) return;


  const newUserRow = document.getElementById('newUserRow');
  const isNewUserRowVisible = newUserRow && window.getComputedStyle(newUserRow).display !== 'none';


  const allRows = tableBody.querySelectorAll('.user-row');
  allRows.forEach(row => {
    row.style.borderBottomLeftRadius = '';
    row.style.borderBottomRightRadius = '';
    row.style.borderBottom = '';
  });


  const visibleRows = Array.from(allRows).filter(row => {
    const style = window.getComputedStyle(row);
    return style.display !== 'none';
  });


  const userRows = visibleRows.filter(row => row.id !== 'newUserRow' && row.id !== 'noUsersMessage');

  if (userRows.length > 0) {
    const lastUserRow = userRows[userRows.length - 1];


    if (visibleRows.length > 0) {
      const lastVisibleRow = visibleRows[visibleRows.length - 1];
      lastVisibleRow.style.borderBottomLeftRadius = '0.3125rem';
      lastVisibleRow.style.borderBottomRightRadius = '0.3125rem';
    }


    if (!isNewUserRowVisible) {
      lastUserRow.style.borderBottom = '0';
    }
  }
}

function updateAddNewUserText() {
  const addNewUserBtn = document.querySelector('.add-new-user');
  if (!addNewUserBtn) return;

  let accountUsers = [];


  if (currentAccountType === 'business' && societyData) {
    accountUsers = societyData.account_users || [];
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const customAccountId = currentAccountType.replace('custom_', '');
    const customAccount = customAccountsData.find(acc => acc.account_identifier === customAccountId);
    if (customAccount) {
      accountUsers = customAccount.account_users || [];
    }
  }

  const currentCount = accountUsers.length;
  const maxUsers = 5;

  addNewUserBtn.textContent = `+ ${_L('ui_add_new_user')} (${currentCount}/${maxUsers})`;
}

function populateAccountUsersModal() {
  let accountUsers = [];
  let accountIdentifier = null;

  if (currentAccountType === 'business' && societyData) {
    accountUsers = societyData.account_users || [];
    accountIdentifier = societyData.society;
  } else if (currentAccountType && currentAccountType.startsWith('custom_')) {
    const customAccountId = currentAccountType.replace('custom_', '');
    const customAccount = customAccountsData.find(acc => acc.account_identifier === customAccountId);
    if (customAccount) {
      accountUsers = customAccount.account_users || [];
      accountIdentifier = customAccount.account_identifier;
    }
  }

  const tableBody = document.querySelector('.users-table-body');
  if (!tableBody) return;

  const existingRows = tableBody.querySelectorAll('.user-row:not(#noUsersMessage):not(#newUserRow)');
  existingRows.forEach(row => row.remove());

  const noUsersMessage = document.getElementById('noUsersMessage');
  if (noUsersMessage) {
    if (accountUsers.length === 0) {
      noUsersMessage.style.display = 'flex';
    } else {
      noUsersMessage.style.display = 'none';
    }
  }

  updateAddNewUserText();

  if (accountUsers.length > 0) {
    const newUserRow = document.getElementById('newUserRow');

    accountUsers.forEach((user, index) => {
      const userRow = document.createElement('div');
      userRow.className = 'user-row';
      userRow.setAttribute('data-citizenid', user.citizenid);

      const permissions = user.permissions || {};
      const depositChecked = permissions.deposit ? 'checked' : '';
      const withdrawChecked = permissions.withdraw ? 'checked' : '';
      const transferChecked = permissions.transfer ? 'checked' : '';
      const loansChecked = permissions.loans ? 'checked' : '';

      userRow.innerHTML = `
        <div class="table-cell col-playerid fw-500">${user.name || user.citizenid}</div>
        <div class="table-cell col-deposit">
          <div class="permission-checkbox ${depositChecked}" data-permission="deposit" data-citizenid="${user.citizenid}">
            <i class="fa-solid fa-check"></i>
          </div>
        </div>
        <div class="table-cell col-withdraw">
          <div class="permission-checkbox ${withdrawChecked}" data-permission="withdraw" data-citizenid="${user.citizenid}">
            <i class="fa-solid fa-check"></i>
          </div>
        </div>
        <div class="table-cell col-transfer">
          <div class="permission-checkbox ${transferChecked}" data-permission="transfer" data-citizenid="${user.citizenid}">
            <i class="fa-solid fa-check"></i>
          </div>
        </div>
        <div class="table-cell col-loans">
          <div class="permission-checkbox ${loansChecked}" data-permission="loans" data-citizenid="${user.citizenid}">
            <i class="fa-solid fa-check"></i>
          </div>
        </div>
        <div class="table-cell col-actions">
          <div class="edit-permissions-btn" title="${_L('ui_edit_permissions')}" data-citizenid="${user.citizenid}">
            <i class="fa-solid fa-pencil"></i>
          </div>
          <div class="remove-user-btn" title="${_L('ui_remove_user')}" data-citizenid="${user.citizenid}">
            <i class="fa-solid fa-trash"></i>
          </div>
        </div>
      `;

      if (newUserRow) {
        tableBody.insertBefore(userRow, newUserRow);
      } else {
        tableBody.appendChild(userRow);
      }
    });
  }

  updateLastVisibleRowBorderRadius();

  updateAddNewUserText();
}

function selectAccount(accountType) {
  const currentAccount = document.querySelector('.account-current .account-info');
  const dropdown = document.getElementById('accountDropdownMenu');
  const container = dropdown ? dropdown.closest('.account-dropdown-container') : null;
  const arrow = document.querySelector('.dropdown-arrow');
  const allOptions = dropdown ? dropdown.querySelectorAll('.account-option:not(.create-new-option)') : [];

  allOptions.forEach(option => {
    option.classList.remove('selected');
    const checkIcon = option.querySelector('.fa-check');
    if (checkIcon) {
      checkIcon.remove();
    }
  });

  if (container) {
    const allRows = container.querySelectorAll('.account-dropdown-row');
    allRows.forEach(row => {
      row.querySelectorAll('.account-option:not(.create-new-option)').forEach(option => {
        option.classList.remove('selected');
        const checkIcon = option.querySelector('.fa-check');
        if (checkIcon) {
          checkIcon.remove();
        }
      });
    });
  }

  const selectedOption = dropdown ? dropdown.querySelector(`[onclick="selectAccount('${accountType}')"]`) : null;
  let accountInfo = null;

  if (selectedOption && !selectedOption.classList.contains('create-new-option')) {
    selectedOption.classList.add('selected');
    const checkIcon = document.createElement('i');
    checkIcon.className = 'fa-solid fa-check';
    selectedOption.appendChild(checkIcon);
    accountInfo = selectedOption.querySelector('.account-info');
  } else if (container) {

    const allRows = container.querySelectorAll('.account-dropdown-row');
    for (const row of allRows) {
      const rowOption = row.querySelector(`[onclick="selectAccount('${accountType}')"]`);
      if (rowOption && !rowOption.classList.contains('create-new-option')) {
        rowOption.classList.add('selected');
        const checkIcon = document.createElement('i');
        checkIcon.className = 'fa-solid fa-check';
        rowOption.appendChild(checkIcon);
        accountInfo = rowOption.querySelector('.account-info');
        break;
      }
    }
  }

  if (currentAccount && accountInfo) {
    currentAccount.innerHTML = accountInfo.innerHTML;
  }

  syncAccountSelection();

  syncAccountSelection();

  if (dropdown && arrow) {
    dropdown.classList.remove('show');
    arrow.classList.remove('rotated');


    const container = dropdown.closest('.account-dropdown-container');
    if (container) {
      const allRows = container.querySelectorAll('.account-dropdown-row');
      allRows.forEach(row => row.classList.remove('show'));
    }
  }

  isChangingAccount = true;
  setActiveAccount(accountType);
  isChangingAccount = false;

  if (accountType !== 'savings') {
    preloadSavingsGoals().catch(() => { });
    preloadActiveLoans().catch(() => { });
  }

  const accountUsersButton = document.querySelector('.account-users-button');
  if (accountUsersButton) {
    let shouldDisable = false;

    if (accountType === 'personal' || accountType === 'savings') {
      shouldDisable = true;
    } else if (accountType === 'business') {

      shouldDisable = !(playerData && playerData.isBoss);
    } else if (accountType && accountType.startsWith('custom_')) {

      const accountIdentifier = accountType.replace('custom_', '');
      const customAccount = customAccountsData.find(acc => acc.account_identifier === accountIdentifier);
      shouldDisable = !(customAccount && customAccount.is_owner);
    }

    if (shouldDisable) {
      accountUsersButton.disabled = true;
      accountUsersButton.style.opacity = 0.5;
      accountUsersButton.style.cursor = 'default';
      accountUsersButton.style.pointerEvents = 'none';
    } else {
      accountUsersButton.disabled = false;
      accountUsersButton.removeAttribute('style');
    }
  }

  if (currentPage === 'overview') {
    if (accountType === 'business') {

      businessCardsData = null;

      loadBusinessCards();
    } else if (accountType === 'personal') {

      if (typeof playerData.playerPIN === 'string') {
        try {
          const cards = JSON.parse(playerData.playerPIN);
          if (!cards || cards.length === 0) {

            resetCardHTMLToDefaults();
          }
        } catch (e) {

          resetCardHTMLToDefaults();
        }
      } else {

        resetCardHTMLToDefaults();
      }

      setCardsInfo();
    } else if (accountType && accountType.startsWith('custom_')) {

      setCardsInfo();

      const accountKey = accountType;
      const account = accounts[accountKey];
      if (account && account.accountData && account.accountData.transactions) {
        const txs = normalizeTransactionsPayload(account.accountData.transactions);
        setActiveTransactions(txs);

        if (currentPage === 'transactions') {
          loadAllTransactions(txs);
        }
      } else {

        setActiveTransactions([]);
        if (currentPage === 'transactions') {
          loadAllTransactions([]);
        }
      }
    } else {

      resetCardHTMLToDefaults();
    }
  }

  if (currentPage === 'bills') {
    updatePayAllButtonVisibility();
  }

  const billsNavItem = $('.nav-item.bills');
  if (billsNavItem.length) {
    if (accountType && accountType.startsWith('custom_')) {

      billsNavItem.hide();

      if (currentPage === 'bills') {
        switchPage('overview');
      }
    } else if (useBilling && (accountType === 'personal' || accountType === 'business')) {

      billsNavItem.show();
    }
  }

  updateLoansTabVisibility(accountType);
}

window.selectAccount = selectAccount;

function printReceipt(refId) {
  if (!refId) {
    console.error('No reference ID provided');
    return;
  }

  const modal = document.getElementById('viewBillModal');
  if (modal) {
    modal.classList.remove('show');
    setTimeout(() => {
      modal.style.display = 'none';
    }, 300);
  }

  const response = fetch(`https://${GetParentResourceName()}/printReceipt`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({ ref_id: refId, openedAccount: openedAccount })
  });
}

function printTransactionReceiptFromIndex(transactionIndex) {
  if (!__txPager || !__txPager.txs) return;
  const transaction = __txPager.txs[transactionIndex];
  if (!transaction) return;


  const accountType = currentAccountType === 'business' ? 'business' : 'personal';
  const activeEntity = getActiveEntity();
  const accountIdentifier = activeEntity.citizenId || '';

  fetch(`https://${GetParentResourceName()}/getTransactionInformation`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({
      transaction: transaction,
      accountType: accountType,
      accountIdentifier: accountIdentifier
    })
  })
    .then(r => r.json())
    .then(data => {
      if (data.success && data.data) {
        printTransactionReceipt(data.data);
      }
    })
    .catch(err => {
      console.error('Error fetching transaction info for receipt:', err);
    });
}

window.printTransactionReceiptFromIndex = printTransactionReceiptFromIndex;

function printTransactionReceipt(txInfo) {
  if (!txInfo) {
    return;
  }
  const modal = document.getElementById('viewTransactionModal');
  if (modal) {
    modal.classList.remove('show');
    setTimeout(() => {
      modal.style.display = 'none';
    }, 300);
  }

  const response = fetch(`https://${GetParentResourceName()}/printTransactionReceipt`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({ txInfo: txInfo, openedAccount: openedAccount })
  });
}

window.printReceipt = printReceipt;

document.addEventListener('click', function (event) {
  const dropdown = document.querySelector('.account-dropdown');
  const dropdownMenu = document.getElementById('accountDropdownMenu');
  const arrow = document.querySelector('.dropdown-arrow');

  if (dropdown && !dropdown.contains(event.target)) {
    if (dropdownMenu) dropdownMenu.classList.remove('show');
    if (arrow) arrow.classList.remove('rotated');
  }
});

document.addEventListener('DOMContentLoaded', function () {
  const tooltipButtons = document.querySelectorAll('.card-button[title]');

  tooltipButtons.forEach(button => {
    button.addEventListener('mouseenter', function () {

      if (this.hasAttribute('title')) {
        this.setAttribute('data-title', this.getAttribute('title'));
        this.removeAttribute('title');
      }
    });

    button.addEventListener('mouseleave', function () {

      if (this.hasAttribute('data-title')) {
        this.setAttribute('title', this.getAttribute('data-title'));
        this.removeAttribute('data-title');
      }
    });
  });
});