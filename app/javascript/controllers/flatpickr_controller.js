import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    console.log('test')
    flatpickr(".datepicker", {
      enableTime: false,
      dateFormat: "Y-m-d",
      minDate: "today"
    });
  }
}
