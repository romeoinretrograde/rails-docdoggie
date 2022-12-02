import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {

  static targets = ["form", "edit"]

  edit() {
    this.formTarget.classList.remove("d-none")
    this.editTarget.classList.add("d-none")
  }
}
