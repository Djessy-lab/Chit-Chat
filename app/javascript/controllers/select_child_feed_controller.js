import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-child-feed"
export default class extends Controller {

    static targets = ["background"]

    changeColor() {

      const green_cards = document.querySelectorAll(".feed-background-green")
      green_cards.forEach((card) => {
        card.classList.remove("feed-background-green")
      })
      this.element.classList.add("feed-background-green")
    }
  }
