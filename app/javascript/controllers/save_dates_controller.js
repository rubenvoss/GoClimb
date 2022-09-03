import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="save-dates"
export default class extends Controller {
  static targets = ["heading"]
  connect() {
    // if youre on crag#show
    // insert header

    // get last char of url
    const char = window.location.href.slice(-1)
    // change char to number, if its a letter returns NaN
    const int = parseInt(char)
    if (int) {
      console.log(window.location.href.slice(-1))

    } else {

    }

  }

  // gets triggered when the user clicks the continue button
  continue() {
    let startDate = flatpickr(search_trip_start_date, {}).selectedDates
    let endDate = flatpickr(search_trip_end_date, {}).selectedDates
    localStorage.setItem("startDate", startDate)
    localStorage.setItem("endDate", endDate)
    console.log(startDate)
    console.log(endDate)
  }

  // gets triggered on the Crag#show page
  show() {
    const startDate = localStorage.getItem('startDate');
    const endDate = localStorage.getItem('endDate');
    console.log(startDate)
    console.log(endDate)
  }
}
