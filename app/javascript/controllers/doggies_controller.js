import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="doggies"
export default class extends Controller {
  connect() {
    console.log("Woof woof!");
  }
}
