import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-dates"
export default class extends Controller {
  continue() {
    let startDate = flatpickr(search_trip_start_date, {}).selectedDates
    let endDate = flatpickr(search_trip_end_date, {}).selectedDates
    localStorage.setItem("startDate", startDate)
    localStorage.setItem("endDate", endDate)
  }

  show() {
    const startDate = localStorage.getItem('startDate');
    const endDate = localStorage.getItem('endDate');
    console.log(startDate)
    console.log(endDate)
  }
}
