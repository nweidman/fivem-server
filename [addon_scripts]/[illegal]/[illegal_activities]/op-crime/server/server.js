const { Image } = require('image-js');
const fs = require('fs');
const path = require('path');

const resourceName = GetCurrentResourceName();
const resourcePath = GetResourcePath(resourceName);
const mainSavePath = path.join(resourcePath, 'web', 'build', 'images');

function ensureDir(p) {
  if (!fs.existsSync(p)) fs.mkdirSync(p, { recursive: true });
}

function sanitizeName(name, fallback = 'image') {
  name = String(name || fallback);
  name = name.replace(/[^a-zA-Z0-9_-]/g, '');
  if (!name.length) name = fallback;
  return name;
}

ensureDir(mainSavePath);

onNet('gangsTakeScreenshotOfFurniture', async (filename, opts = {}) => {
  const safeName = sanitizeName(filename, 'image');
  const mode = (opts && opts.mode) ? String(opts.mode) : 'auto';
  const tolerance = Number.isFinite(opts?.tolerance) ? opts.tolerance : 38;

  ensureDir(mainSavePath);

  const fullFilePath = path.join(mainSavePath, `${safeName}.png`);
  console.log(`[gangsTakeScreenshotOfFurniture] Saving: ${fullFilePath} (mode=${mode}, tol=${tolerance})`);

  exports['screenshot-basic'].requestClientScreenshot(
    source,
    {
      fileName: fullFilePath,
      encoding: 'png',
      quality: 1.0,
    },
    async (err, fileName) => {
      if (err) {
        console.error('[gangsTakeScreenshotOfFurniture] screenshot-basic error:', err);
        return;
      }

      try {
        let image = await Image.load(fileName);

        for (let x = 0; x < image.width; x++) {
          for (let y = 0; y < image.height; y++) {
            const pixelArr = image.getPixelXY(x, y);
            const r = pixelArr[0];
            const g = pixelArr[1];
            const b = pixelArr[2];

            if (g > r + b) {
              image.setPixelXY(x, y, [255, 255, 255, 0]);
            }
          }
        }

        let minX = image.width;
        let maxX = -1;
        let minY = image.height;
        let maxY = -1;

        for (let x = 0; x < image.width; x++) {
          for (let y = 0; y < image.height; y++) {
            const pixelArr = image.getPixelXY(x, y);
            const alpha = pixelArr[3];

            if (alpha > 0) {
              minX = Math.min(minX, x);
              maxX = Math.max(maxX, x);
              minY = Math.min(minY, y);
              maxY = Math.max(maxY, y);
            }
          }
        }

        if (maxX >= minX && maxY >= minY) {
          const contentWidth = maxX - minX + 1;
          const contentHeight = maxY - minY + 1;

          const croppedImage = image.crop({
            x: minX,
            y: minY,
            width: contentWidth,
            height: contentHeight
          });

          image.data = croppedImage.data;
          image.width = croppedImage.width;
          image.height = croppedImage.height;
        }

        image.save(fileName);
      } catch (e) {
        console.error('[gangsTakeScreenshotOfFurniture] processing error:', e);
      }
    }
  );
});