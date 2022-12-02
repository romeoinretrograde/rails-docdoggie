import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="medications"
export default class extends Controller {

  static targets = ["timeOfDay","listButton"]

  activate(event) {
    event.preventDefault()
    const button = event.currentTarget
    button.classList.toggle("active-button")

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


    this.listButtonTargets.forEach(list => {
      if (list !== button) {
      list.classList.remove("active-button")
      }
    })

    this.timeOfDayTargets.forEach(time => {
      if (time !== this.div) {
        time.classList.add("d-none")
      }
    });
  }
}
