import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="save-dates"
export default class extends Controller {
  static targets = ["heading"]
  // gets triggered when the user clicks the continue button
  continue() {
    let startDate = flatpickr(search_trip_start_date, {}).selectedDates
    let endDate = flatpickr(search_trip_end_date, {}).selectedDates
    localStorage.setItem("startDate", startDate)
    localStorage.setItem("endDate", endDate)
    console.log(startDate)
    console.log(endDate)
  }
}
