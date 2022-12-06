import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox"
export default class extends Controller {
  connect() {
    const selectAll = document.getElementById("medication_weekdays_all")
    const inputList = Array.from(document.querySelector("#medication-checkboxes").children)
    inputList.shift();
    selectAll.addEventListener("click", (event) => {
      inputList.forEach((checkbox) => {
        selectAll.checked
        checkbox.children[0].checked = selectAll.checked;
    });
    });
  }


}
