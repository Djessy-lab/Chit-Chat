import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-child-feed"
export default class extends Controller {

    static targets = ["background"]

    changeColor() {
      console.log(this.element);
      console.log(this.element.querySelector(".select-child-feed"));
      if (this.element.querySelector == ('.select-child-feed')) {
      } else {
        this.backgroundTarget.classList.toggle("feed-background-green")
      }
    }
  }
