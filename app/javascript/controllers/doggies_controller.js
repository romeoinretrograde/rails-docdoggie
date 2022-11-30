import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="doggies"
export default class extends Controller {

  static targets = ["form", "input"]

  getImage(event) {
    event.preventDefault()
    const dog = document.querySelector(".active")
    const image = `doggies/${dog.firstElementChild.id}.png`
    this.inputTarget.value = image
    this.formTarget.submit()
  }
}
