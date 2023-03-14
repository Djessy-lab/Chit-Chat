import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

// Connects to data-controller="calendar"
export default class extends Controller {
  static values = {
    url: String
  }
  static targets = ["date", "input"]

  connect() {
    flatpickr('#date-calendar', {
      "locale": French,
      dateFormat: "d/m/Y",
      maxDate: Date.now()+1,
      defaultDate: Date.now()
    });
    this.submit()
  }

  submit() {
    fetch(`${this.urlValue}?date=${this.dateTarget.value}`)
    .then(response => response.text())
    .then((data) => {
      this.inputTarget.innerHTML = data
    })
  }
}
