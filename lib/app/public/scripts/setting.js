let slider = document.querySelector("#slider")
let slider_val = document.querySelector('#slider_val')

slider.addEventListener('change', handleRangeUpdate);
slider.addEventListener('mousemove', handleRangeUpdate);

function handleRangeUpdate() {
  slider_val.textContent = this.value;
}
