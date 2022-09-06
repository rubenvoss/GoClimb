import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="save-dates"
export default class extends Controller {
  static targets = ["travellingClimbers", "start_date", "end_date"]
  static values = { cragId: Number }

  makeYear(flatpickr_date) {
    let date = new Date(flatpickr_date)
    let year = date.getFullYear()
    return year
  }
  makeMonth(flatpickr_date) {
    let date = new Date(flatpickr_date)
    // for some reason flatpickr gives the month with -1
    let month = date.getMonth() + 1
    return month
  }
  makeDay(flatpickr_date) {
    let date = new Date(flatpickr_date)
    let day = date.getDate()
    return day
  }
  makeDateParams(date){
    return `${this.makeYear(date)}_${this.makeMonth(date)}_${this.makeDay(date)}`
  }

  displayTravellingClimbers(startDate, endDate) {
    // if you reload the page, this doesnt insert data!!!
    const url = `/trips?start_date=${this.makeDateParams(startDate)}&end_date=${this.makeDateParams(endDate)}&crag_id=${this.cragIdValue}`
    // console.log(url)
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.travellingClimbersTarget.insertAdjacentHTML("beforeend", data)
      })
  }

  // gets triggered when the user clicks the continue button
  continue() {
    // setting date variables to have selected start and end dates available
    let startDate = flatpickr(search_trip_start_date, {}).selectedDates[0]
    let endDate = flatpickr(search_trip_end_date, {}).selectedDates[0]

    // inserts HTML to display all travelling climbers
    this.displayTravellingClimbers(startDate, endDate)

    // setting dates in local storage to make them available after tab closes
    localStorage.setItem("startDate", startDate)
    localStorage.setItem("endDate", endDate)
  }
}
