// ══════════════════════════════════════════════════
// Wax Target HUD Controller
// ══════════════════════════════════════════════════

const waxTarget = {
    visible: false,
    aimed: false,
    focused: false,
};

// Cache of full rail data from server (includes points arrays for clipboard)
let _waxRailsCache = [];

window.addEventListener('message', (event) => {
    const data = event.data;

    // ── Target circle messages ──

    if (data.type === 'wax_target_show') {
        document.getElementById('waxTargetContainer').style.display = 'block';
        document.getElementById('waxTargetCircle').className = 'wax-circle idle';
        document.getElementById('waxTargetOptions').style.display = 'none';
        waxTarget.visible = true;
        waxTarget.aimed = false;
        waxTarget.focused = false;
    }

    else if (data.type === 'wax_target_hide') {
        document.getElementById('waxTargetContainer').style.display = 'none';
        document.getElementById('waxTargetOptions').style.display = 'none';
        waxTarget.visible = false;
        waxTarget.aimed = false;
        waxTarget.focused = false;
    }

    else if (data.type === 'wax_target_aimed') {
        document.getElementById('waxTargetCircle').className = 'wax-circle aimed';
        waxTarget.aimed = true;
        buildOptions(data.options || []);
    }

    else if (data.type === 'wax_target_unaimed') {
        document.getElementById('waxTargetCircle').className = 'wax-circle idle';
        document.getElementById('waxTargetOptions').style.display = 'none';
        waxTarget.aimed = false;
    }

    else if (data.type === 'wax_target_focus') {
        waxTarget.focused = data.focused;
        if (data.focused && waxTarget.aimed) {
            document.getElementById('waxTargetOptions').style.display = 'block';
        } else {
            document.getElementById('waxTargetOptions').style.display = 'none';
        }
    }

    // ── HUD panel messages ──

    else if (data.type === 'wax_hud_show') {
        document.getElementById('waxHudPanel').style.display = 'block';
        document.getElementById('waxHudPoints').textContent = data.points || 0;
    }

    else if (data.type === 'wax_hud_hide') {
        document.getElementById('waxHudPanel').style.display = 'none';
    }

    else if (data.type === 'wax_hud_update') {
        document.getElementById('waxHudPoints').textContent = data.points || 0;
    }

    // ── Wax list messages ──

    else if (data.type === 'wax_list_show') {
        document.getElementById('waxListPanel').style.display = 'block';
    }

    else if (data.type === 'wax_list_hide') {
        document.getElementById('waxListPanel').style.display = 'none';
    }

    else if (data.type === 'wax_list_update') {
        _waxRailsCache = data.rails || [];
        buildWaxList(_waxRailsCache);
    }
});

// ══════════════════════════════════════════════════
// Target options builder
// ══════════════════════════════════════════════════

function buildOptions(options) {
    const container = document.getElementById('waxTargetOptions');
    container.innerHTML = '';

    const icons = { info: 'i', add: '+', remove: '-', delete: 'x', undo: '↩', save: '✓', cancel: '×', extend: '+', relocate: '↔', confirm_relocate: '✓', cancel_relocate: '×', toggle_closed: '⟳' };

    options.forEach(opt => {
        const div = document.createElement('div');
        let classes = 'wax-option';
        if (opt.id === 'info') classes += ' info';
        if (opt.id === 'delete' || opt.id === 'cancel' || opt.id === 'cancel_relocate') classes += ' delete';
        if (opt.id === 'save' || opt.id === 'confirm_relocate') classes += ' save';
        if (opt.disabled) classes += ' disabled';
        div.className = classes;

        div.innerHTML = `<span class="wax-option-icon">${icons[opt.id] || ''}</span>${opt.label}`;

        if (opt.id !== 'info' && !opt.disabled) {
            div.addEventListener('click', () => {
                fetch(`https://${GetParentResourceName()}/waxTargetSelect`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ action: opt.id })
                });
            });
        }

        container.appendChild(div);
    });
}

// ══════════════════════════════════════════════════
// Wax list builder
// ══════════════════════════════════════════════════

function buildWaxList(rails) {
    const container = document.getElementById('waxListContent');
    container.innerHTML = '';
    const badge = document.getElementById('waxListCount');
    if (badge) badge.textContent = rails.length;

    const toolbar = document.createElement('div');
    toolbar.className = 'wax-list-toolbar';
    const copyAllBtn = document.createElement('button');
    copyAllBtn.className = 'wax-list-toolbar-btn copy';
    copyAllBtn.textContent = 'Copy All';
    copyAllBtn.disabled = rails.length === 0;
    copyAllBtn.addEventListener('click', () => copyAllRails());
    const copyRangeBtn = document.createElement('button');
    copyRangeBtn.className = 'wax-list-toolbar-btn copy';
    copyRangeBtn.textContent = 'Copy Range';
    copyRangeBtn.disabled = rails.length === 0;
    copyRangeBtn.addEventListener('click', () => showRangeModal());
    const insertBtn = document.createElement('button');
    insertBtn.className = 'wax-list-toolbar-btn insert';
    insertBtn.textContent = 'Insert (Paste)';
    insertBtn.addEventListener('click', () => pasteRails());
    toolbar.appendChild(copyAllBtn);
    toolbar.appendChild(copyRangeBtn);
    toolbar.appendChild(insertBtn);
    container.appendChild(toolbar);

    if (rails.length === 0) {
        const empty = document.createElement('div');
        empty.className = 'wax-list-empty';
        empty.textContent = 'No wax paths saved.';
        container.appendChild(empty);
        return;
    }

    const sorted = rails.map((rail, idx) => ({ rail, cacheIdx: idx }));
    sorted.sort((a, b) => {
        const numA = parseInt((a.rail.name.match(/Wax_(\d+)/) || [])[1]) || 0;
        const numB = parseInt((b.rail.name.match(/Wax_(\d+)/) || [])[1]) || 0;
        return numA - numB;
    });

    sorted.forEach(({ rail, cacheIdx }) => {
        const item = document.createElement('div');
        item.className = 'wax-list-item';
        const info = document.createElement('div');
        info.className = 'wax-list-item-info';
        const nameEl = document.createElement('div');
        nameEl.className = 'wax-list-item-name';
        nameEl.textContent = rail.name;
        const detailsEl = document.createElement('div');
        detailsEl.className = 'wax-list-item-details';
        detailsEl.textContent = rail.pointCount + ' points \u00b7 ' + rail.length + 'm' + (rail.closed ? ' \u00b7 loop' : '');
        info.appendChild(nameEl);
        info.appendChild(detailsEl);
        item.appendChild(info);

        const btnGroup = document.createElement('div');
        btnGroup.className = 'wax-list-item-actions';

        const tpBtn = document.createElement('button');
        tpBtn.className = 'wax-list-btn teleport';
        tpBtn.textContent = 'TP';
        tpBtn.title = 'Teleport to this spot';
        tpBtn.addEventListener('click', () => {
            fetch('https://' + GetParentResourceName() + '/waxListTeleport', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ index: rail.index })
            });
            showWaxToast('Teleporting to ' + rail.name + '...');
        });
        btnGroup.appendChild(tpBtn);

        const renameBtn = document.createElement('button');
        renameBtn.className = 'wax-list-btn rename';
        renameBtn.textContent = 'Rename';
        renameBtn.addEventListener('click', () => showRenameModal(rail.index, rail.name));
        btnGroup.appendChild(renameBtn);

        const copyBtn = document.createElement('button');
        copyBtn.className = 'wax-list-btn copy';
        copyBtn.textContent = 'Copy';
        copyBtn.addEventListener('click', () => copySingleRail(cacheIdx));
        btnGroup.appendChild(copyBtn);

        const delBtn = document.createElement('button');
        delBtn.className = 'wax-list-btn delete';
        delBtn.textContent = 'Del';
        delBtn.addEventListener('click', () => {
            fetch('https://' + GetParentResourceName() + '/waxListDelete', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ index: rail.index })
            });
        });
        btnGroup.appendChild(delBtn);

        item.appendChild(btnGroup);
        container.appendChild(item);
    });
}


// ══════════════════════════════════════════════════
// Clipboard Helpers (fallback for CEF)
// ══════════════════════════════════════════════════

function copyToClipboard(text) {
    // Try modern API first, fallback to execCommand for FiveM CEF
    if (navigator.clipboard && navigator.clipboard.writeText) {
        return navigator.clipboard.writeText(text).catch(() => execCopy(text));
    }
    return execCopy(text);
}

function execCopy(text) {
    return new Promise((resolve, reject) => {
        const ta = document.createElement('textarea');
        ta.value = text;
        ta.style.position = 'fixed';
        ta.style.left = '-9999px';
        document.body.appendChild(ta);
        ta.select();
        try {
            document.execCommand('copy');
            resolve();
        } catch (e) {
            reject(e);
        }
        document.body.removeChild(ta);
    });
}


// ══════════════════════════════════════════════════
// Clipboard Copy/Paste Functions
// ══════════════════════════════════════════════════

function buildClipboardPayload(railIndices) {
    const railsToExport = railIndices.map(i => _waxRailsCache[i]).filter(Boolean);
    return JSON.stringify({
        bdx_wax_spots: true,
        rails: railsToExport.map(r => ({
            name: r.name,
            points: r.points,
            closed: r.closed || false,
        }))
    }, null, 2);
}

function copySingleRail(cacheIndex) {
    const payload = buildClipboardPayload([cacheIndex]);
    copyToClipboard(payload).then(() => {
        showWaxToast('Copied 1 rail to clipboard');
    }).catch(() => {
        showWaxToast('Copy failed');
    });
}

function copyAllRails() {
    const indices = _waxRailsCache.map((_, i) => i);
    const payload = buildClipboardPayload(indices);
    copyToClipboard(payload).then(() => {
        showWaxToast('Copied ' + _waxRailsCache.length + ' rail(s) to clipboard');
    }).catch(() => {
        showWaxToast('Copy failed');
    });
}

function copyRangeRails(rangeStr) {
    const indices = parseRange(rangeStr, _waxRailsCache.length);
    if (indices.length === 0) {
        showWaxToast('Invalid range');
        return;
    }
    const payload = buildClipboardPayload(indices);
    copyToClipboard(payload).then(() => {
        showWaxToast('Copied ' + indices.length + ' rail(s) to clipboard');
    }).catch(() => {
        showWaxToast('Copy failed');
    });
}

// Check if an imported rail is a duplicate of any existing rail
// Uses percentage-based matching: if 80%+ of points are within threshold, it's a duplicate
function isDuplicateRail(importedRail) {
    const threshold = 2.0; // meters — tolerance for "same spot" detection
    const matchPercent = 0.8; // 80% of points must match to be considered duplicate

    function dist3d(a, b) {
        const dx = a.x - b.x, dy = a.y - b.y, dz = a.z - b.z;
        return Math.sqrt(dx*dx + dy*dy + dz*dz);
    }

    const impPts = importedRail.points;
    if (!impPts || impPts.length < 2) return false;

    for (const existing of _waxRailsCache) {
        if (!existing.points || existing.points.length < 2) continue;
        const exPts = existing.points;

        // For each point in the imported rail, find the nearest point in the existing rail
        let matched = 0;
        for (const ip of impPts) {
            let minDist = Infinity;
            for (const ep of exPts) {
                const d = dist3d(ip, ep);
                if (d < minDist) minDist = d;
            }
            if (minDist < threshold) matched++;
        }

        // If 80%+ of imported points are near an existing rail's points, it's a duplicate
        if (matched / impPts.length >= matchPercent) {
            return true;
        }
    }
    return false;
}

function pasteRails() {
    showPasteModal();
}

function importFromText(text) {
    let data;
    try {
        data = JSON.parse(text);
    } catch (e) {
        showWaxToast('Invalid JSON data');
        return;
    }

    if (!data || data.bdx_wax_spots !== true) {
        showWaxToast('Not a valid BDX wax export');
        return;
    }

    if (!Array.isArray(data.rails) || data.rails.length === 0) {
        showWaxToast('No rails found in data');
        return;
    }

    const validRails = data.rails.filter(r =>
        r && Array.isArray(r.points) && r.points.length >= 2 &&
        r.points.every(p => typeof p.x === 'number' && typeof p.y === 'number' && typeof p.z === 'number')
    );

    if (validRails.length === 0) {
        showWaxToast('No valid rails in data');
        return;
    }

    // Filter out duplicates that already exist
    const newRails = validRails.filter(r => !isDuplicateRail(r));
    const skipped = validRails.length - newRails.length;

    if (newRails.length === 0) {
        showWaxToast('All ' + validRails.length + ' rail(s) already exist');
        return;
    }

    fetch(`https://${GetParentResourceName()}/waxListImport`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ rails: newRails })
    });

    let msg = 'Importing ' + newRails.length + ' rail(s)...';
    if (skipped > 0) msg += ' (' + skipped + ' duplicate(s) skipped)';
    showWaxToast(msg);
}

// ══════════════════════════════════════════════════
// Range Parser (e.g., "1-5", "3,7", "1-3,5,8-10")
// ══════════════════════════════════════════════════

function parseRange(rangeStr, maxCount) {
    const indices = new Set();
    const parts = rangeStr.split(',').map(s => s.trim()).filter(Boolean);

    for (const part of parts) {
        if (part.includes('-')) {
            const [startStr, endStr] = part.split('-').map(s => s.trim());
            const start = parseInt(startStr, 10);
            const end = parseInt(endStr, 10);
            if (isNaN(start) || isNaN(end)) continue;
            for (let i = Math.max(1, start); i <= Math.min(maxCount, end); i++) {
                indices.add(i - 1);
            }
        } else {
            const num = parseInt(part, 10);
            if (!isNaN(num) && num >= 1 && num <= maxCount) {
                indices.add(num - 1);
            }
        }
    }

    return Array.from(indices).sort((a, b) => a - b);
}

// ══════════════════════════════════════════════════
// Range Modal
// ══════════════════════════════════════════════════

function showRangeModal() {
    const modal = document.getElementById('waxRangeModal');
    const input = document.getElementById('waxRangeInput');
    modal.style.display = 'flex';
    input.value = '';
    input.focus();
}

function hideRangeModal() {
    document.getElementById('waxRangeModal').style.display = 'none';
}

document.getElementById('waxRangeConfirm').addEventListener('click', () => {
    const val = document.getElementById('waxRangeInput').value.trim();
    hideRangeModal();
    if (val) copyRangeRails(val);
});

document.getElementById('waxRangeCancel').addEventListener('click', () => {
    hideRangeModal();
});

document.getElementById('waxRangeInput').addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
        e.preventDefault();
        const val = e.target.value.trim();
        hideRangeModal();
        if (val) copyRangeRails(val);
    } else if (e.key === 'Escape') {
        e.preventDefault();
        hideRangeModal();
    }
});

// ══════════════════════════════════════════════════
// Paste Modal
// ══════════════════════════════════════════════════

function showPasteModal() {
    const modal = document.getElementById('waxPasteModal');
    const input = document.getElementById('waxPasteInput');
    modal.style.display = 'flex';
    input.value = '';
    input.focus();
}

function hidePasteModal() {
    document.getElementById('waxPasteModal').style.display = 'none';
}

document.getElementById('waxPasteConfirm').addEventListener('click', () => {
    const val = document.getElementById('waxPasteInput').value.trim();
    hidePasteModal();
    if (val) importFromText(val);
});

document.getElementById('waxPasteCancel').addEventListener('click', () => {
    hidePasteModal();
});

// ══════════════════════════════════════════════════
// Toast Notification
// ══════════════════════════════════════════════════

function showWaxToast(message) {
    let toast = document.getElementById('waxToast');
    if (!toast) {
        toast = document.createElement('div');
        toast.id = 'waxToast';
        toast.className = 'wax-toast';
        document.body.appendChild(toast);
    }
    toast.textContent = message;
    toast.classList.add('show');
    clearTimeout(toast._timer);
    toast._timer = setTimeout(() => {
        toast.classList.remove('show');
    }, 2500);
}

// ══════════════════════════════════════════════════
// ══════════════════════════════════════════════════
// Rename Modal
// ══════════════════════════════════════════════════

let _renameRailIndex = null;

function showRenameModal(railIndex, currentName) {
    _renameRailIndex = railIndex;
    const modal = document.getElementById('waxRenameModal');
    const input = document.getElementById('waxRenameInput');
    modal.style.display = 'flex';
    input.value = currentName;
    input.focus();
    input.select();
}

function hideRenameModal() {
    document.getElementById('waxRenameModal').style.display = 'none';
    _renameRailIndex = null;
}

function confirmRename() {
    const val = document.getElementById('waxRenameInput').value.trim();
    if (!val || _renameRailIndex === null) { hideRenameModal(); return; }
    fetch('https://' + GetParentResourceName() + '/waxListRename', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ index: _renameRailIndex, newName: val })
    });
    showWaxToast('Renamed to ' + val);
    hideRenameModal();
}

document.getElementById('waxRenameConfirm').addEventListener('click', () => confirmRename());
document.getElementById('waxRenameCancel').addEventListener('click', () => hideRenameModal());
document.getElementById('waxRenameInput').addEventListener('keydown', (e) => {
    if (e.key === 'Enter') { e.preventDefault(); confirmRename(); }
    else if (e.key === 'Escape') { e.preventDefault(); hideRenameModal(); }
});


// Close handlers
// ══════════════════════════════════════════════════

// ESC closes range modal, wax list, or target options
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        if (document.getElementById('waxRenameModal').style.display === 'flex') {
            hideRenameModal();
            return;
        }
        if (document.getElementById('waxPasteModal').style.display === 'flex') {
            hidePasteModal();
            return;
        }
        if (document.getElementById('waxRangeModal').style.display === 'flex') {
            hideRangeModal();
            return;
        }
        if (document.getElementById('waxListPanel').style.display === 'block') {
            fetch(`https://${GetParentResourceName()}/waxListClose`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            });
        } else if (waxTarget.focused) {
            fetch(`https://${GetParentResourceName()}/waxTargetClose`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            });
        }
    }
});

// Right-click closes the options panel
document.addEventListener('contextmenu', (e) => {
    if (waxTarget.focused) {
        e.preventDefault();
        fetch(`https://${GetParentResourceName()}/waxTargetClose`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({})
        });
    }
});

// Wax list close button
document.getElementById('waxListCloseBtn').addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/waxListClose`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
});

function GetParentResourceName() {
    return 'BDX-Sport-Hub';
}
