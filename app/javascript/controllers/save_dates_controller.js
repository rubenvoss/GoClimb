import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="save-dates"
export default class extends Controller {
  static targets = ["travelling_climbers", "start_date", "end_date"]

  displayTravellingClimbers() {
    const url = `start_date=${this.startDateTarget.value}&end_date=${this.endDateTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        // this.listTarget.innerHTML = " "
        // this.listTarget.innerHTML = data
        console.log(data)
      })
    // fetch(
    //   "http://localhost:3000/crags/7"
    //   // this.travelling_climbersTarget.action
    //   // ,
    // //   {
    // //   method: "POST",
    // //   headers: { "Accept": "application/json" },
    // //   body: new FormData(this.formTarget)
    // // }
    // )
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data)
    //   })
    // fetch('https://jsonplaceholder.typicode.com/todos/1')
    // .then(response => response.json())
    // .then(json => console.log(json))
  }


  // gets triggered when the user clicks the continue button
  continue() {
    let startDate = flatpickr(search_trip_start_date, {}).selectedDates
    let endDate = flatpickr(search_trip_end_date, {}).selectedDates
    localStorage.setItem("startDate", startDate)
    localStorage.setItem("endDate", endDate)
    console.log(startDate)
    console.log(endDate)
    console.log(`localhost.com/trips?start_date=${startDate}&end_date=${endDate}`)
    this.displayTravellingClimbers()
  }
}
