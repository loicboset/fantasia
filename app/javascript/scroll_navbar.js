console.log("hello from scroll_navbar.js");

const navbar = document.querySelector('.navbar-lewagon');
const navbarPos = document.querySelector('.navbar-lewagon').offsetTop;
console.log(navbarPos)

const scroll_navbar = () => {
  if (window.pageYOffset > navbarPos) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
};

window.addEventListener('scroll', (e) => {
  scroll_navbar();
})

export { scroll_navbar }
