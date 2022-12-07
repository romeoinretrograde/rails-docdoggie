import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="taken-medications"
export default class extends Controller {
  connect() {
    console.log("TakenMedications controller is connected!");
  }

  showTreat() {
    
  }
}
