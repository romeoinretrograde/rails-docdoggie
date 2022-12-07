import { Controller } from "@hotwired/stimulus"
import swal from 'sweetalert';


// Connects to data-controller="swal"
export default class extends Controller {
  connect() {
    const initSweetalert = (selector, options = {}, callback = () => {}) => {
      const swalButton = document.getElementById(selector);
      console.log(swalButton)
      if (swalButton) { // protect other pages
        swalButton.addEventListener('click', () => {
          console.log("clicked!")
          swal(options).then(callback); // <-- add the `.then(callback)`
        });
      }
    };
    const allButtons = document.querySelectorAll(".swal-buttons-morning");
    console.log(allButtons)
    allButtons.forEach((button) => {
      initSweetalert(button.id, {
        title: "Are you sure?",
        text: "This action cannot be reversed",
        icon: "warning",
        buttons: ["cancel", "confirm"],
      }, (value) => {
        if (value) {
          const medId = button.dataset.medicationId
          const link = document.querySelector(`#delete-link-${medId}`);
          link.click();
        }
      });
    });
 }
}
