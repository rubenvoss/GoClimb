import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-dates"
export default class extends Controller {
  connect() {
    console.log("save dates controller is connected")
  }
  continue() {
    console.log("you pressed submit")
  }
}
