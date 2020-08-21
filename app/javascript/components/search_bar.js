
const searchBar = () => {
  const indexView = document.querySelector("#index-view");
  if (indexView) {
    const selectCharacters = document.querySelector("#select_characters");
    selectCharacters.classList.add("hidden")
    const searchDiv = document.querySelector("#search-div")
    const searchInput = document.querySelector("#search_query")
    const resultDiv = document.getElementById('results');
    const characters = document.querySelectorAll("#select_characters option");
    characters.forEach((character) => {
      character.classList.add("hidden");
    })
    const input = document.querySelector("#search_query");
      input.addEventListener('keyup', (e) => {
      resultDiv.innerHTML = "";
      searchDiv.classList.add("hidden");
      searchInput.classList.remove("unstyle");
      characters.forEach((character) => {
        if (character.innerText.toUpperCase().includes(input.value.toUpperCase()) && input.value != "") {
          const newLi = document.createElement("a");
          newLi.setAttribute("href", `/characters/${character.getAttribute("value")}`)
          const newContent = document.createTextNode(character.innerText);
          newLi.appendChild(newContent);
          searchDiv.classList.remove("hidden");
          searchInput.classList.add("unstyle");
          resultDiv.appendChild(newLi);
        }
      })
    })
  }
}

export { searchBar }
