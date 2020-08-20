const scrollNavbar = () => {
  const indexView = document.querySelector("#index-view");
  if (indexView) {
    const navbar = document.querySelector('.navbar-homepage');
    if (navbar != null) {
      window.addEventListener('scroll', (e) => {
        const navbar = document.querySelector('.navbar-homepage');
        const searchBar = document.querySelector('.simple_form.search-bar');
        if (navbar) {
          const navbarPos = navbar.offsetTop;
          if (window.pageYOffset > navbarPos) {
            navbar.classList.add("sticky")
            searchBar.classList.add("sticky-bar")
          } else {
            navbar.classList.remove("sticky");
            searchBar.classList.remove("sticky-bar")
          }
        }
      })
    }
  }
};

export { scrollNavbar }
