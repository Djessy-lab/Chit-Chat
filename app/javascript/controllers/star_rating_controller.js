import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"

// Connects to data-controller="icon-rating"
export default class extends Controller {
  connect() {
    new StarRating(this.element)
  }
}
