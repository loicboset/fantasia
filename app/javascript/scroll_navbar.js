console.log("hello from scroll_navbar.js");



const scroll_navbar = () => {
  window.addEventListener('scroll', (e) => {
    const navbar = document.querySelector('.navbar-lewagon');
    const searchBar = document.querySelector('.simple_form.search-bar');
    const navbarPos = document.querySelector('.navbar-lewagon').offsetTop;
    if (window.pageYOffset > navbarPos) {
      navbar.classList.add("sticky")
      searchBar.classList.add("sticky-bar")
    } else {
      navbar.classList.remove("sticky");
      searchBar.classList.remove("sticky-bar")
    }
  })
};

// scroll_navbar()

export { scroll_navbar }
