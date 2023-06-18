const navigationHeight = document.querySelector('.navbar-lewagon').offsetHeight;
document.documentElement.style.setProperty('--scroll-padding', navigationHeight + 329 + "px")

const aboutLink = document.querySelector('.about-link')

aboutLink.addEventListener("click", (event) => {
  event.preventDefault()
  window.scrollTo({
    top: 2700,
    behavior: 'smooth'
  })
})
