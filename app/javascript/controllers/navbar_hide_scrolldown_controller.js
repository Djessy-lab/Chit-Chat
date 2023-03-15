import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-hide-scrolldown"
export default class extends Controller {

  static targets = ["navbar-hide-scrolldown"]

  const lastScrollTop
  updateNavbar() {
    const navbar = document.querySelector(".navbar");
    const scrollTop = window.scrollY
    if (scrollTop > lastScrollTop) {
      navbar.classList.add("navbar-hidden")
    } else {
      navbar.classList.remove("navbar-hidden")
    }
    lastScrollTop = scrollTop;
  }
}

// window.addEventListener('scroll',function(){
//   var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
//   if(scrollTop > lastScrollTop){
//   navbar.style.top='-80px';
//   }
//   else{
//   navbar.style.top='0';
//   }
//   lastScrollTop = scrollTop;
//   });
