// app/javascript/controllers/flatpickr_controller.js
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs

  connect() {
    flatpickr(this.element, { inline: true, mode: "multiple",
    dateFormat: "d-m-Y",
    defaultDate: ["9-12-2022"] })
  }
  
}
