const Container = document.getElementById('Container');
const Bar = document.getElementById('Bar');
const Label = document.getElementById('BarLabel');

let Noise = 0;
let MaxNoise = 100;
let Text = "NOISE BAR";

window.addEventListener('message', (event) => {
  const data = event.data;
  if (data.action === "show") {
    Container.classList.add('active');
    Label.textContent = data.text || Text;
  } else if (data.action === "hide") {
    Container.classList.remove('active');
    Noise = 0;
    UpdateBar();
  } else if (data.action === "update") {
    Noise = data.noise;
    UpdateBar();
  } else if (data.action === 'setmax') {
    MaxNoise = data.max;
    UpdateBar();
  }
});

function UpdateBar() {
  const Percentage = Math.min((Noise / MaxNoise) * 100, 100);
  Bar.style.right = '5px';
  Bar.style.left = '5px';
  Bar.style.width = `calc(${Percentage}% - 10px)`;

  if (Percentage <= 33) {
    ChangeColor('rgb(0, 200, 0)', 'rgba(0, 200, 0, 0.7)');
  } else if (Percentage <= 66) {
    ChangeColor('rgb(255, 165, 0)', 'rgba(255, 165, 0, 0.7)');
  } else {
    ChangeColor('rgb(215, 0, 0)', 'rgba(215, 0, 0, 0.7)');
  }
}

function ChangeColor(bg, shadow) {
  Bar.style.backgroundColor = bg;
  Bar.style.boxShadow = `0 0 8px ${shadow}`;
}