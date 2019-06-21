let container = document.getElementById('alphabet-container')

function createAlphabetButtons() {
  container.innerHTML = ""

  for(let i = 0; i < 26; i++) {
    container.innerHTML += `<input class="btn letter-btn" type="submit" name="letter" value="${String.fromCharCode(65 + i)}">`
  }
}

createAlphabetButtons()

container.addEventListener('click', disableButton)

function disableButton(e) {
  if(e.target.name == "letter") {
    e.target.disabled = true
    e.target.classList.add("used-letter-btn")
  }
}