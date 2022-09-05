import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="save-dates"
export default class extends Controller {
  static targets = ["travellingClimbers", "start_date", "end_date"]

  makeYear(flatpickr_date) {
    let date = new Date(flatpickr_date)
    let year= date.getFullYear();
    return year
  }
  makeMonth(flatpickr_date) {
    let date = new Date(flatpickr_date)
    let month= date.getMonth();
    return month
  }
  makeDay(flatpickr_date) {
    let date = new Date(flatpickr_date)
    let day= date.getDate();
    return day
  }
  makeDateParams(date){
    return `${this.makeYear(date)}_${this.makeMonth(date)}_${this.makeDay(date)}`
  }

  displayTravellingClimbers(startDate, endDate) {
    // if you reload the page, this doesnt insert data!!!
    const url = `http://localhost:3000/trips?start_date=${this.makeDateParams(startDate)}&end_date=${this.makeDateParams(endDate)}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.travellingClimbersTarget.insertAdjacentHTML("beforeend", data)

      })
  }

  // gets triggered when the user clicks the continue button
  continue() {
    let startDate = flatpickr(search_trip_start_date, {}).selectedDates
    let endDate = flatpickr(search_trip_end_date, {}).selectedDates
    localStorage.setItem("startDate", startDate)
    localStorage.setItem("endDate", endDate)
    this.displayTravellingClimbers(startDate, endDate)
  }
}
