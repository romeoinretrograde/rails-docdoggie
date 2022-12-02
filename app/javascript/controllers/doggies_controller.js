import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="doggies"
export default class extends Controller {

  static targets = ["form", "input", "doggieInfo", "doggieForm"]

  getImage(event) {
    event.preventDefault()
    const dog = document.querySelector(".active")
    const image = `doggies/${dog.firstElementChild.id}.png`
    this.inputTarget.value = image
    this.formTarget.submit()
  }

  edit() {
    this.doggieInfoTarget.classList.add("d-none")
    this.doggieFormTarget.classList.remove("d-none")
  }
}
