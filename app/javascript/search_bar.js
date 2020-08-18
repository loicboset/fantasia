const searchBar = () => {
  const bar = document.querySelector("#search_query");
  bar.addEventListener('keyup', (e) => {
    const characters = document.querySelectorAll(".col-sm-12.col-md-6.col-lg-4");
    const input = document.querySelector(".simple_form.search-bar input");
    console.log(characters[0].querySelector(".character-card h4").innerText)
    for (let i = 0; i < characters.length; i++) {
      const txtValue = characters[i].querySelector("h4").innerText.toUpperCase();
      if (txtValue.includes(input.value.toUpperCase())) {
        characters[i].style.display = "block";
      } else {
        characters[i].style.display = "none";
      }
    }
  })
};

export { searchBar };
