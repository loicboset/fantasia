console.log("hello from scroll_navbar.js");



const scroll_navbar = () => {
  window.addEventListener('scroll', (e) => {
    const navbar = document.querySelector('.navbar-lewagon');
    const navbarPos = document.querySelector('.navbar-lewagon').offsetTop;
    console.log(navbarPos)
    if (window.pageYOffset > navbarPos) {
      navbar.classList.add("sticky")
    } else {
      navbar.classList.remove("sticky");
    }
  })
};

// scroll_navbar()

export { scroll_navbar }
