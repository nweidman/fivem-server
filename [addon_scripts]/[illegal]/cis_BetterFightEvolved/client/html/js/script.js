// Global variables
let crosshairSettings = {};
let isCrosshairMenuOpen = false;
let recoilCompensationEnabled = false;
let recoilAmount = 0;
let recoilInterval = null;
let recoilTimeout = null;
let presets = {};
let currentPreset = '';

// DOM elements
const crosshairTop = document.getElementById('crosshair-top');
const crosshairRight = document.getElementById('crosshair-right');
const crosshairBottom = document.getElementById('crosshair-bottom');
const crosshairLeft = document.getElementById('crosshair-left');
const crosshairCenter = document.getElementById('crosshair-center');
const crosshairContainer = document.getElementById('crosshair-container');
const crosshairMenu = document.getElementById('crosshair-menu');
const centerDotToggle = document.getElementById('center-dot-toggle');
const centerDotSize = document.getElementById('center-dot-size');
const outerLinesToggle = document.getElementById('outer-lines-toggle');
const outerLineLength = document.getElementById('outer-line-length');
const outerLineThickness = document.getElementById('outer-line-thickness');
const crosshairColor = document.getElementById('crosshair-color');
const crosshairOpacity = document.getElementById('crosshair-opacity');
const outlineToggle = document.getElementById('outline-toggle');
const outlineThickness = document.getElementById('outline-thickness');
const outlineColor = document.getElementById('outline-color');
const outlineOpacity = document.getElementById('outline-opacity');
const saveButton = document.getElementById('save-button');
const closeButton = document.getElementById('close-button');
const recoilCompensationToggle = document.getElementById('recoil-compensation-toggle');
const centerDotType = document.getElementById('center-dot-type');
const lineType = document.getElementById('line-type');

crosshairContainer.style.opacity = '0'; // Hide the crosshair initially

// Utility functions
function log(message) {
  console.log("[Crosshair Debug] " + message);
}

function hexToRgba(hex, opacity) {
  var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  if (result) {
    var r = parseInt(result[1], 16);
    var g = parseInt(result[2], 16);
    var b = parseInt(result[3], 16);
    return `rgba(${r}, ${g}, ${b}, ${opacity})`;
  }
  return 'rgba(255, 255, 255, 1)'; // Default to white if invalid hex color
}

function setCrosshairColor(element, color) {
  if (element.classList.contains('triangle')) {
    element.style.borderColor = `transparent transparent ${color} transparent`;
  } else {
    element.style.backgroundColor = color;
  }
}

// Crosshair update functions
function updateCrosshairPreview() {

  if (!presets[currentPreset]) {
    console.error(`[Crosshair Error] Current preset "${currentPreset}" does not exist.`);
    return;
  }
  
  // Update the crosshair thickness
  const outerLineThicknessValue = parseInt(outerLineThickness.value);
  crosshairTop.style.width = `${outerLineThicknessValue}px`;
  crosshairBottom.style.width = `${outerLineThicknessValue}px`;
  crosshairRight.style.height = `${outerLineThicknessValue}px`;
  crosshairLeft.style.height = `${outerLineThicknessValue}px`;

  // Update the crosshair length
  const outerLineLengthValue = parseInt(outerLineLength.value);
  crosshairTop.style.height = `${outerLineLengthValue}px`;
  crosshairBottom.style.height = `${outerLineLengthValue}px`;
  crosshairRight.style.width = `${outerLineLengthValue}px`;
  crosshairLeft.style.width = `${outerLineLengthValue}px`;

  // Update the crosshair offset
  const outerLineOffsetValue = parseInt(document.getElementById('outer-line-offset').value);
  const halfLength = outerLineLengthValue / 2;
  crosshairTop.style.top = `-${outerLineOffsetValue + halfLength}px`;
  crosshairBottom.style.bottom = `-${outerLineOffsetValue + halfLength}px`;
  crosshairRight.style.right = `-${outerLineOffsetValue + halfLength}px`;
  crosshairLeft.style.left = `-${outerLineOffsetValue + halfLength}px`;

  // Update the outer line positions
  crosshairTop.style.left = '50%';
  crosshairTop.style.transform = 'translateX(-50%)';
  crosshairBottom.style.left = '50%';
  crosshairBottom.style.transform = 'translateX(-50%)';
  crosshairRight.style.top = '50%';
  crosshairRight.style.transform = 'translateY(-50%)';
  crosshairLeft.style.top = '50%';
  crosshairLeft.style.transform = 'translateY(-50%)';

  // Update the crosshair color and opacity
  const color = hexToRgba(crosshairColor.value, crosshairOpacity.value);
  crosshairTop.style.backgroundColor = color;
  crosshairRight.style.backgroundColor = color;
  crosshairBottom.style.backgroundColor = color;
  crosshairLeft.style.backgroundColor = color;

  // Update the crosshair outline
  const outlineThicknessValue = parseInt(outlineThickness.value) / 1.5;
  const outlineColorValue = hexToRgba(outlineColor.value, outlineOpacity.value);
  const outlineStyle = outlineToggle.checked ? `${outlineThicknessValue}px solid ${outlineColorValue}` : 'none';
  crosshairTop.style.outline = outlineStyle;
  crosshairRight.style.outline = outlineStyle;
  crosshairBottom.style.outline = outlineStyle;
  crosshairLeft.style.outline = outlineStyle;

  // Update the crosshair visibility
  crosshairTop.style.display = outerLinesToggle.checked ? 'block' : 'none';
  crosshairRight.style.display = outerLinesToggle.checked ? 'block' : 'none';
  crosshairBottom.style.display = outerLinesToggle.checked ? 'block' : 'none';
  crosshairLeft.style.display = outerLinesToggle.checked ? 'block' : 'none';
  crosshairCenter.style.display = centerDotToggle.checked ? 'block' : 'none';

  // Update the center dot size
  const centerDotSizeValue = parseInt(centerDotSize.value);
  crosshairCenter.style.width = `${centerDotSizeValue}px`;
  crosshairCenter.style.height = `${centerDotSizeValue}px`;

  // Remove all classes and add the selected one
  crosshairCenter.className = '';
  crosshairCenter.classList.add(centerDotType.value);

  if (centerDotType.value === 'triangle') {
    crosshairCenter.style.width = '0';
    crosshairCenter.style.height = '0';
    crosshairCenter.style.backgroundColor = 'transparent';
    crosshairCenter.style.borderStyle = 'solid';
    crosshairCenter.style.borderWidth = `0 ${centerDotSizeValue / 2}px ${centerDotSizeValue}px ${centerDotSizeValue / 2}px`;
    crosshairCenter.style.borderColor = `transparent transparent ${color} transparent`;
  } else {
    crosshairCenter.style.borderStyle = 'none';
    crosshairCenter.style.backgroundColor = color;
  }
  crosshairCenter.style.outline = outlineStyle;

  // Update the crosshair visibility based on the Line Type setting
  const lineTypeValue = lineType.value;
  const showLines = outerLinesToggle.checked;

  crosshairTop.style.display = (showLines && lineTypeValue === '4') ? 'block' : 'none';
  crosshairRight.style.display = (showLines && (lineTypeValue === '2' || lineTypeValue === '3' || lineTypeValue === '4')) ? 'block' : 'none';
  crosshairBottom.style.display = (showLines && (lineTypeValue === '1' || lineTypeValue === '3' || lineTypeValue === '4')) ? 'block' : 'none';
  crosshairLeft.style.display = (showLines && (lineTypeValue === '2' || lineTypeValue === '3' || lineTypeValue === '4')) ? 'block' : 'none';
}

function updateCrosshairVisibility(isAiming) {
  crosshairContainer.style.opacity = (isAiming || isCrosshairMenuOpen) ? '1' : '0';
}

function updateRecoilCompensationSetting() {
  recoilCompensationEnabled = recoilCompensationToggle.checked;
}

function handleRecoilCompensation(amount) {
  const preset = presets[currentPreset];
  const outerLineOffsetValue = preset.outerLineOffset || crosshairSettings.outerLineOffset;
  const outerLineLengthValue = preset.outerLineLength || crosshairSettings.outerLineLength;
  const halfLength = outerLineLengthValue / 2;

  recoilAmount += amount;
  const maxRecoilOffset = 20;
  const recoilDuration = 50; // in milliseconds
  const recoilReturnDuration = 500; // in milliseconds

  if (recoilTimeout) {
    clearTimeout(recoilTimeout);
  }

  if (!recoilInterval) {
    recoilInterval = setInterval(() => {
      const recoilOffset = (recoilAmount / 10) * maxRecoilOffset;
      crosshairTop.style.top = `-${outerLineOffsetValue + halfLength + recoilOffset}px`;
      crosshairBottom.style.bottom = `-${outerLineOffsetValue + halfLength + recoilOffset}px`;
      crosshairRight.style.right = `-${outerLineOffsetValue + halfLength + recoilOffset}px`;
      crosshairLeft.style.left = `-${outerLineOffsetValue + halfLength + recoilOffset}px`;
    }, recoilDuration);
  }

  recoilTimeout = setTimeout(() => {
    clearInterval(recoilInterval);
    recoilInterval = null;

    const recoilReturnInterval = setInterval(() => {
      if (recoilAmount > 0) {
        recoilAmount -= 0.1;
        const recoilOffset = (recoilAmount / 10) * maxRecoilOffset;
        crosshairTop.style.top = `-${outerLineOffsetValue + halfLength + recoilOffset}px`;
        crosshairBottom.style.bottom = `-${outerLineOffsetValue + halfLength + recoilOffset}px`;
        crosshairRight.style.right = `-${outerLineOffsetValue + halfLength + recoilOffset}px`;
        crosshairLeft.style.left = `-${outerLineOffsetValue + halfLength + recoilOffset}px`;
      } else {
        clearInterval(recoilReturnInterval);
        recoilAmount = 0;
      }
    }, recoilReturnDuration / 100);
  }, recoilReturnDuration);
}

//Sort presets by number and then by name
function sortPresets(presets) {
  return Object.keys(presets).sort((a, b) => {
      const aNum = parseInt(a.match(/\d+/));
      const bNum = parseInt(b.match(/\d+/));
      
      if (!isNaN(aNum) && !isNaN(bNum)) {
          return aNum - bNum;
      } else if (!isNaN(aNum)) {
          return -1;
      } else if (!isNaN(bNum)) {
          return 1;
      } else {
          return a.localeCompare(b);
      }
  });
}

// Menu functions
function populatePresetDropdown() {
  const presetDropdown = document.getElementById('preset-dropdown');
  presetDropdown.innerHTML = '';

  const sortedPresetNames = sortPresets(presets);

  for (const presetName of sortedPresetNames) {
      const option = document.createElement('option');
      option.value = presetName;
      option.text = presetName;
      presetDropdown.add(option);
  }

  // Set the first preset as default
  if (sortedPresetNames.length > 0) {
      currentPreset = sortedPresetNames[0];
      presetDropdown.value = currentPreset;
  }
}

function populateMenuInputs() {
  const preset = presets[currentPreset] || {};
  
  centerDotToggle.checked = preset.showCenterDot !== undefined ? preset.showCenterDot : (crosshairSettings.showCenterDot || false);
  centerDotSize.value = preset.centerDotSize || crosshairSettings.centerDotSize || 5;
  outerLinesToggle.checked = preset.showOuterLines !== undefined ? preset.showOuterLines : (crosshairSettings.showOuterLines || false);
  outerLineLength.value = preset.outerLineLength || crosshairSettings.outerLineLength || 10;
  outerLineThickness.value = preset.outerLineThickness || crosshairSettings.outerLineThickness || 2;
  document.getElementById('outer-line-offset').value = preset.outerLineOffset || crosshairSettings.outerLineOffset || 0;
  crosshairColor.value = preset.crosshairColor || crosshairSettings.crosshairColor || '#ffffff';
  crosshairOpacity.value = preset.crosshairOpacity !== undefined ? preset.crosshairOpacity : (crosshairSettings.crosshairOpacity || 1);
  outlineToggle.checked = preset.showOutline !== undefined ? preset.showOutline : (crosshairSettings.showOutline || false);
  outlineThickness.value = preset.outlineThickness || crosshairSettings.outlineThickness || 1;
  outlineColor.value = preset.outlineColor || crosshairSettings.outlineColor || '#000000';
  outlineOpacity.value = preset.outlineOpacity !== undefined ? preset.outlineOpacity : (crosshairSettings.outlineOpacity || 1);
  recoilCompensationToggle.checked = preset.recoilCompensationEnabled !== undefined ? preset.recoilCompensationEnabled : (crosshairSettings.recoilCompensationEnabled || false);
  centerDotType.value = preset.centerDotType || crosshairSettings.centerDotType || 'dot';
  lineType.value = preset.lineType || crosshairSettings.lineType || '4';
}

function saveCrosshairSettings() {
  try {
      // log("Saving crosshair settings");
      crosshairSettings.presets[currentPreset] = {
          showCenterDot: centerDotToggle.checked,
          centerDotSize: parseInt(centerDotSize.value),
          showOuterLines: outerLinesToggle.checked,
          outerLineLength: parseInt(outerLineLength.value),
          outerLineThickness: parseInt(outerLineThickness.value),
          outerLineOffset: parseInt(document.getElementById('outer-line-offset').value),
          crosshairColor: crosshairColor.value,
          crosshairOpacity: parseFloat(crosshairOpacity.value),
          showOutline: outlineToggle.checked,
          outlineThickness: parseInt(outlineThickness.value),
          outlineColor: outlineColor.value,
          outlineOpacity: parseFloat(outlineOpacity.value),
          recoilCompensationEnabled: recoilCompensationToggle.checked,
          centerDotType: centerDotType.value,
          lineType: lineType.value
      };

      $.post('https://cis_BetterFightEvolved/saveCrosshairSettings', JSON.stringify({ presets: crosshairSettings.presets }), function(response) {
          if (response.success) {
              // log("Crosshair settings saved successfully");
          } else {
              console.error("Failed to save crosshair settings:", response.error);
          }
      });
  } catch (error) {
      console.error("[Crosshair Error] Error saving settings: ", error);
  }
}

function closeCrosshairMenu() {
  try {
      // log("Closing crosshair menu");
      isCrosshairMenuOpen = false;
      document.getElementById('crosshair-menu').style.display = 'none';
      $.post('https://cis_BetterFightEvolved/closeCrosshairMenu', JSON.stringify({}));
      updateCrosshairVisibility(false);
      // log("Crosshair menu closed");
  } catch (error) {
      console.error("[Crosshair Error] Error closing menu: ", error);
  }
}

// Event Listeners (continued)
window.addEventListener('message', function (event) {
  try {
      const data = event.data;

      if (data.type === 'initializeCrosshairSettings') {
          // log("Initializing crosshair settings");
          crosshairSettings = data.settings;
          presets = data.presets || {};
          populatePresetDropdown(); // This will now set the currentPreset
          populateMenuInputs();
          updateCrosshairPreview();
          updateCrosshairVisibility(false);
          // log("Crosshair settings initialized");
      } else if (data.type === 'updateCrosshairVisibility') {
          updateCrosshairVisibility(data.isAiming);
      } else if (data.type === 'openCrosshairMenu') {
          // log("Opening crosshair menu");
          isCrosshairMenuOpen = true;
          document.getElementById('crosshair-menu').style.display = 'block';
          populateMenuInputs();
          updateCrosshairPreview();
          updateCrosshairVisibility(true);
          // log("Crosshair menu opened");
      } else if (data.type === 'triggerRecoilCompensation') {
          if (presets[currentPreset].recoilCompensationEnabled !== undefined ? presets[currentPreset].recoilCompensationEnabled : crosshairSettings.recoilCompensationEnabled) {
              handleRecoilCompensation(data.amount);
          }
      }
  } catch (error) {
      console.error("[Crosshair Error] ", error);
  }
});

document.getElementById('preset-dropdown').addEventListener('change', function () {
  currentPreset = this.value;
  populateMenuInputs();
  updateCrosshairPreview();
});

document.getElementById('save-button').addEventListener('click', function () {
  saveCrosshairSettings();
  $.post('https://cis_BetterFightEvolved/updateCrosshairSettings', JSON.stringify({ presets: presets }));
  closeCrosshairMenu();
});

document.getElementById('close-button').addEventListener('click', closeCrosshairMenu);

// Event listener for the preset dropdown change
document.getElementById('preset-dropdown').addEventListener('change', function () {
  currentPreset = this.value;
  populateMenuInputs();
  updateCrosshairPreview();
});

// Event listener for the save button
saveButton.addEventListener('click', function () {
  saveCrosshairSettings();
  crosshairMenu.classList.remove('visible');
  setTimeout(() => {
      isCrosshairMenuOpen = false;
      crosshairMenu.style.display = 'none';
      updateCrosshairVisibility(false);
      $.post('https://cis_BetterFightEvolved/closeCrosshairMenu', JSON.stringify({}));
  }, 300);
});

// Event listener for the close button
closeButton.addEventListener('click', function () {
  crosshairMenu.classList.remove('visible');
  setTimeout(() => {
    isCrosshairMenuOpen = false;
    crosshairMenu.style.display = 'none';
    $.post('https://cis_BetterFightEvolved/closeCrosshairMenu', JSON.stringify({}));
    updateCrosshairVisibility(false); // Hide the crosshair when the menu is closed
  }, 300); // Delay to allow the fade-out transition to complete
});

// On 'Esc' call close method
document.onkeyup = function (data) {
  if (data.which == 27) {
      closeCrosshairMenu();
  }
};

centerDotType.addEventListener('change', updateCrosshairPreview);
lineType.addEventListener('change', updateCrosshairPreview);
centerDotToggle.addEventListener('change', updateCrosshairPreview);
outerLinesToggle.addEventListener('change', updateCrosshairPreview);
centerDotSize.addEventListener('input', updateCrosshairPreview);
outerLineLength.addEventListener('input', updateCrosshairPreview);
outerLineThickness.addEventListener('input', updateCrosshairPreview);
document.getElementById('outer-line-offset').addEventListener('input', updateCrosshairPreview);
crosshairColor.addEventListener('input', updateCrosshairPreview);
crosshairOpacity.addEventListener('input', updateCrosshairPreview);
outlineToggle.addEventListener('change', updateCrosshairPreview);
outlineThickness.addEventListener('input', updateCrosshairPreview);
outlineColor.addEventListener('input', updateCrosshairPreview);
outlineOpacity.addEventListener('input', updateCrosshairPreview);
recoilCompensationToggle.addEventListener('change', updateRecoilCompensationSetting);