// Keybind Settings Menu
// Sport Hub - Per-player control binding configuration

(function() {
    'use strict';

    var CONTROL_NAMES = {
        0:'V', 1:'Mouse Right', 2:'Mouse Left', 3:'Mouse Down', 4:'Mouse Up',
        14:'Scroll Down', 15:'Scroll Up', 18:'Enter', 19:'Left Alt', 20:'Z',
        21:'Left Shift', 22:'Space', 23:'F', 24:'Left Click', 25:'Right Click',
        26:'C', 29:'B', 32:'W', 33:'S', 34:'A', 35:'D', 36:'L. Ctrl',
        37:'Tab', 38:'E', 39:'[', 40:']', 44:'Q', 45:'R', 47:'G',
        52:'Q', 56:'F9', 57:'F10', 73:'X', 74:'H', 80:'R',
        81:'.', 82:',', 83:'=', 84:'-',
        113:'G', 131:'L. Shift', 132:'L. Ctrl', 137:'Caps',
        157:'1', 158:'2', 159:'6', 160:'3', 161:'7', 162:'8', 163:'9', 164:'4', 165:'5',
        166:'F5', 167:'F6', 170:'F3', 171:'Caps', 172:'Arrow Up', 173:'Arrow Down',
        174:'Arrow Left', 175:'Arrow Right', 177:'Backspace', 178:'Delete',
        182:'L', 199:'P', 204:'Tab', 243:'~', 244:'M', 245:'T', 246:'Y', 249:'N',
        288:'F1', 289:'F2', 311:'K', 344:'F11', 345:'F12'
    };

    // Reverse map: JS KeyboardEvent.code -> GTA Control ID
    // Reference: https://docs.fivem.net/docs/game-references/controls/
    var KEY_TO_CONTROL = {
        'KeyA': 34, 'KeyB': 29, 'KeyC': 26, 'KeyD': 35, 'KeyE': 38,
        'KeyF': 23, 'KeyG': 47, 'KeyH': 74, 'KeyK': 311, 'KeyL': 182,
        'KeyM': 244, 'KeyN': 249, 'KeyP': 199, 'KeyQ': 44, 'KeyR': 45,
        'KeyS': 33, 'KeyT': 245, 'KeyV': 0, 'KeyW': 32, 'KeyX': 73,
        'KeyY': 246, 'KeyZ': 20,
        'Space': 22, 'ShiftLeft': 21, 'ShiftRight': 21,
        'ControlLeft': 36, 'ControlRight': 36,
        'AltLeft': 19, 'AltRight': 19,
        'Tab': 37, 'Enter': 18, 'Backspace': 177, 'Delete': 178,
        'CapsLock': 137,
        'ArrowUp': 172, 'ArrowDown': 173, 'ArrowLeft': 174, 'ArrowRight': 175,
        'F1': 288, 'F2': 289, 'F3': 170, 'F5': 166, 'F9': 56, 'F10': 57,
        'Digit1': 157, 'Digit2': 158, 'Digit3': 160, 'Digit4': 164,
        'Digit5': 165, 'Digit6': 159, 'Digit7': 161, 'Digit8': 162,
        'Digit9': 163,
        'Numpad1': 161, 'Numpad2': 167, 'Numpad3': 160, 'Numpad4': 164,
        'Numpad5': 165, 'Numpad6': 159, 'Numpad7': 162, 'Numpad8': 166,
        'Numpad9': 163,
        'BracketLeft': 39, 'BracketRight': 40,
        'Comma': 82, 'Period': 81, 'Equal': 83, 'Minus': 84,
        'Backquote': 243
    };

    var SCROLL_UP_CONTROL = 15;
    var SCROLL_DOWN_CONTROL = 14;

    function getControlName(id) {
        return CONTROL_NAMES[id] || ('ID: ' + id);
    }

    var SPORT_META = {
        skate: { icon: String.fromCodePoint(0x1F6F9), name: 'Skateboard', desc: 'Tricks, grinds & movement' }
    };

    var isOpen = false;
    var currentPage = 'main';
    var bindings = {};
    var uiBindings = {};
    var pendingChanges = {};
    var pendingUI = {};
    var listeningAction = null;
    var listeningSection = null;

    function applyDetectedKey(controlId) {
        if (!listeningAction) return;
        var act = listeningAction;
        var sec = listeningSection;
        listeningAction = null;
        listeningSection = null;
        if (sec === 'ui') {
            pendingUI[act] = controlId;
        } else {
            pendingChanges[currentPage][act] = controlId;
        }
        render();
    }

    window.addEventListener('message', function(event) {
        var data = event.data;

        if (data.action === 'openKeybindMenu') {
            bindings = data.bindings || {};
            uiBindings = data.uiBindings || {};
            pendingChanges = {};
            pendingUI = {};
            for (var sport in bindings) {
                pendingChanges[sport] = {};
                for (var action in bindings[sport]) {
                    pendingChanges[sport][action] = bindings[sport][action].key;
                }
            }
            for (var uiAct in uiBindings) {
                pendingUI[uiAct] = uiBindings[uiAct].key;
            }
            currentPage = 'main';
            isOpen = true;
            listeningAction = null;
            listeningSection = null;
            render();
            document.getElementById('keybindOverlay').classList.add('active');
        }

        if (data.action === 'closeKeybindMenu') {
            closeMenu();
        }

        if (data.action === 'keybindDetected') {
            if (listeningAction && data.controlId !== undefined) {
                applyDetectedKey(data.controlId);
            }
        }
    });

    function render() {
        var headerLeft = document.getElementById('kbHeaderLeft');
        var content = document.getElementById('kbContent');
        var footer = document.getElementById('kbFooter');
        var closeBtn = document.getElementById('kbCloseBtn');
        content.innerHTML = '';

        if (currentPage === 'main') {
            closeBtn.style.display = '';
            renderMainPage(headerLeft, content, footer);
        } else {
            closeBtn.style.display = 'none';
            renderSportPage(currentPage, headerLeft, content, footer);
        }
    }

    function renderMainPage(headerLeft, content, footer) {
        headerLeft.innerHTML = '<div class="kb-header-icon">&#9881;</div><div class="kb-header-title">Settings</div>';
        footer.style.display = 'none';

        var uiTitle = document.createElement('div');
        uiTitle.className = 'kb-section-title';
        uiTitle.textContent = 'UI Settings';
        content.appendChild(uiTitle);

        for (var uiAct in uiBindings) {
            (function(action, info) {
                var row = document.createElement('div');
                row.className = 'kb-row';
                row.style.padding = '8px 22px';

                var label = document.createElement('div');
                label.className = 'kb-row-label';
                label.textContent = info.label;

                var right = document.createElement('div');
                right.className = 'kb-row-right';

                var currentKey = pendingUI[action];
                var defaultKey = info.default;
                var isModified = currentKey !== defaultKey;
                var isListen = listeningAction === action && listeningSection === 'ui';

                var keyBtn = document.createElement('button');
                keyBtn.className = 'kb-key-btn' + (isListen ? ' listening' : '') + (isModified ? ' modified' : '');
                keyBtn.textContent = isListen ? 'Press a key...' : getControlName(currentKey);
                keyBtn.addEventListener('click', function() {
                    if (listeningAction === action && listeningSection === 'ui') {
                        listeningAction = null;
                        listeningSection = null;
                        render();
                    } else {
                        listeningAction = action;
                        listeningSection = 'ui';
                        render();
                    }
                });

                var resetBtn = document.createElement('button');
                resetBtn.className = 'kb-reset-btn' + (isModified ? '' : ' hidden');
                resetBtn.innerHTML = '&#x21A9;';
                resetBtn.title = 'Reset to default';
                resetBtn.addEventListener('click', function() {
                    pendingUI[action] = defaultKey;
                    render();
                });

                right.appendChild(keyBtn);
                right.appendChild(resetBtn);
                row.appendChild(label);
                row.appendChild(right);
                content.appendChild(row);
            })(uiAct, uiBindings[uiAct]);
        }

        var divider = document.createElement('div');
        divider.className = 'kb-divider';
        content.appendChild(divider);

        var sportsTitle = document.createElement('div');
        sportsTitle.className = 'kb-section-title';
        sportsTitle.textContent = 'Sports';
        content.appendChild(sportsTitle);

        var sports = Object.keys(bindings);
        for (var i = 0; i < sports.length; i++) {
            (function(sport) {
                var meta = SPORT_META[sport] || { icon: '', name: sport, desc: '' };
                var item = document.createElement('div');
                item.className = 'kb-sport-item';

                var left = document.createElement('div');
                left.className = 'kb-sport-item-left';

                var icon = document.createElement('div');
                icon.className = 'kb-sport-item-icon';
                icon.textContent = meta.icon;

                var info = document.createElement('div');
                var nameEl = document.createElement('div');
                nameEl.className = 'kb-sport-item-name';
                nameEl.textContent = meta.name;
                var descEl = document.createElement('div');
                descEl.className = 'kb-sport-item-desc';
                descEl.textContent = meta.desc;
                info.appendChild(nameEl);
                info.appendChild(descEl);

                left.appendChild(icon);
                left.appendChild(info);

                var arrow = document.createElement('div');
                arrow.className = 'kb-sport-item-arrow';
                arrow.innerHTML = '&#x276F;';

                item.appendChild(left);
                item.appendChild(arrow);
                item.addEventListener('click', function() {
                    if (listeningAction) {
                        listeningAction = null;
                        listeningSection = null;
                    }
                    currentPage = sport;
                    render();
                });
                content.appendChild(item);
            })(sports[i]);
        }
    }

    function renderSportPage(sport, headerLeft, content, footer) {
        var meta = SPORT_META[sport] || { icon: '', name: sport, desc: '' };

        headerLeft.innerHTML = '';
        var backBtn = document.createElement('button');
        backBtn.className = 'kb-back';
        backBtn.innerHTML = '&#x276E;';
        backBtn.title = 'Back';
        backBtn.addEventListener('click', function() {
            if (listeningAction) {
                listeningAction = null;
                listeningSection = null;
            }
            currentPage = 'main';
            render();
        });
        headerLeft.appendChild(backBtn);

        var titleEl = document.createElement('div');
        titleEl.className = 'kb-header-title';
        titleEl.textContent = meta.name;
        headerLeft.appendChild(titleEl);

        footer.style.display = 'flex';

        var sportBindings = bindings[sport];
        if (!sportBindings) {
            content.innerHTML = '<div style="color:rgba(255,255,255,0.4);text-align:center;padding:40px;">No bindings available</div>';
            return;
        }

        var categories = {};
        for (var action in sportBindings) {
            var b = sportBindings[action];
            var cat = b.category || 'General';
            if (!categories[cat]) categories[cat] = [];
            var entry = { action: action };
            for (var k in b) entry[k] = b[k];
            categories[cat].push(entry);
        }

        var catOrder = ['Air Pose', 'Tricks', 'Manual', 'Floor', 'Grind', 'Movement', 'General'];
        var sortedCats = Object.keys(categories).sort(function(a, b) {
            var ai = catOrder.indexOf(a), bi = catOrder.indexOf(b);
            return (ai === -1 ? 99 : ai) - (bi === -1 ? 99 : bi);
        });

        for (var ci = 0; ci < sortedCats.length; ci++) {
            var cat = sortedCats[ci];
            var section = document.createElement('div');
            section.className = 'kb-category';

            var title = document.createElement('div');
            title.className = 'kb-category-title';
            title.textContent = cat;
            section.appendChild(title);

            var items = categories[cat];
            for (var ii = 0; ii < items.length; ii++) {
                (function(item) {
                    var row = document.createElement('div');
                    row.className = 'kb-row';

                    var label = document.createElement('div');
                    label.className = 'kb-row-label';
                    label.textContent = item.label;

                    var right = document.createElement('div');
                    right.className = 'kb-row-right';

                    var currentKey = pendingChanges[sport][item.action];
                    var defaultKey = item.default;
                    var isModified = currentKey !== defaultKey;
                    var isListen = listeningAction === item.action && listeningSection === 'sport';

                    var keyBtn = document.createElement('button');
                    keyBtn.className = 'kb-key-btn' + (isListen ? ' listening' : '') + (isModified ? ' modified' : '');
                    keyBtn.textContent = isListen ? 'Press a key...' : getControlName(currentKey);
                    keyBtn.addEventListener('click', function() {
                        if (listeningAction === item.action && listeningSection === 'sport') {
                            listeningAction = null;
                            listeningSection = null;
                            render();
                        } else {
                            listeningAction = item.action;
                            listeningSection = 'sport';
                            render();
                        }
                    });

                    var resetBtn = document.createElement('button');
                    resetBtn.className = 'kb-reset-btn' + (isModified ? '' : ' hidden');
                    resetBtn.innerHTML = '&#x21A9;';
                    resetBtn.title = 'Reset to default';
                    resetBtn.addEventListener('click', function() {
                        pendingChanges[sport][item.action] = defaultKey;
                        render();
                    });

                    right.appendChild(keyBtn);
                    right.appendChild(resetBtn);
                    row.appendChild(label);
                    row.appendChild(right);
                    section.appendChild(row);
                })(items[ii]);
            }

            content.appendChild(section);
        }
    }

    function closeMenu() {
        isOpen = false;
        listeningAction = null;
        listeningSection = null;
        document.getElementById('keybindOverlay').classList.remove('active');
        fetch('https://BDX-Sport-Hub/keybindClose', { method: 'POST', body: '{}' });
    }

    function saveBindings() {
        var sportChanges = {};
        for (var sport in pendingChanges) {
            for (var action in pendingChanges[sport]) {
                if (pendingChanges[sport][action] !== bindings[sport][action].default) {
                    if (!sportChanges[sport]) sportChanges[sport] = {};
                    sportChanges[sport][action] = pendingChanges[sport][action];
                }
            }
        }
        var uiChanges = {};
        for (var uiAct in pendingUI) {
            if (pendingUI[uiAct] !== uiBindings[uiAct].default) {
                uiChanges[uiAct] = pendingUI[uiAct];
            }
        }
        fetch('https://BDX-Sport-Hub/keybindSave', {
            method: 'POST',
            body: JSON.stringify({ changes: sportChanges, uiChanges: uiChanges })
        });
        closeMenu();
    }

    function resetAll() {
        if (currentPage === 'main') {
            for (var uiAct in pendingUI) {
                pendingUI[uiAct] = uiBindings[uiAct].default;
            }
        } else {
            for (var action in pendingChanges[currentPage]) {
                pendingChanges[currentPage][action] = bindings[currentPage][action].default;
            }
        }
        render();
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('kbCloseBtn').addEventListener('click', closeMenu);
        document.getElementById('kbSaveBtn').addEventListener('click', saveBindings);
        document.getElementById('kbResetAllBtn').addEventListener('click', resetAll);
    });

    // JS-based key detection (NUI has focus so Lua cannot detect controls)
    document.addEventListener('keydown', function(e) {
        if (!isOpen) return;

        if (listeningAction) {
            if (e.key === 'Escape') {
                listeningAction = null;
                listeningSection = null;
                render();
                e.preventDefault();
                e.stopPropagation();
                return;
            }

            var controlId = KEY_TO_CONTROL[e.code];
            if (controlId !== undefined) {
                applyDetectedKey(controlId);
                e.preventDefault();
                e.stopPropagation();
                return;
            }
            e.preventDefault();
            e.stopPropagation();
            return;
        }

        if (e.key === 'Escape') {
            if (currentPage !== 'main') {
                currentPage = 'main';
                render();
            } else {
                closeMenu();
            }
            e.preventDefault();
            e.stopPropagation();
        }
    });

    // Mouse button detection for listening mode
    document.addEventListener('mousedown', function(e) {
        if (!isOpen || !listeningAction) return;
        if (e.button === 2) {
            applyDetectedKey(25);
            e.preventDefault();
            e.stopPropagation();
        } else if (e.button === 1) {
            applyDetectedKey(14);
            e.preventDefault();
            e.stopPropagation();
        }
    }, true);

    // Scroll detection for listening mode
    document.addEventListener('wheel', function(e) {
        if (!isOpen || !listeningAction) return;
        if (e.deltaY < 0) {
            applyDetectedKey(SCROLL_UP_CONTROL);
        } else if (e.deltaY > 0) {
            applyDetectedKey(SCROLL_DOWN_CONTROL);
        }
        e.preventDefault();
        e.stopPropagation();
    }, { passive: false, capture: true });

    // Prevent context menu when right-clicking during listening
    document.addEventListener('contextmenu', function(e) {
        if (isOpen && listeningAction) {
            e.preventDefault();
        }
    });
})();
