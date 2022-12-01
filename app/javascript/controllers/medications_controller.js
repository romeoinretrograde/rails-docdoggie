import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="medications"
export default class extends Controller {

  static targets = ["timeOfDay"]

  activate(event) {
    event.preventDefault()
    const button = event.currentTarget

    if (button.classList.contains("all-button")) {
      this.div = document.querySelector("#all-meds");
      this.div.classList.toggle("d-none");
    } else if (button.classList.contains("morning-button")) {
      this.div = document.querySelector("#morning-meds");
      this.div.classList.toggle("d-none");
    } else if (button.classList.contains("afternoon-button")) {
      this.div = document.querySelector("#afternoon-meds");
      this.div.classList.toggle("d-none");
    } else {
      this.div = document.querySelector("#night-meds");
      this.div.classList.toggle("d-none");
    }

    this.timeOfDayTargets.forEach(time => {
      if (time !== this.div) {
        time.classList.add("d-none")
      }
    });
  }
}
