import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="save-dates"
export default class extends Controller {
  static targets = ["travelling_climbers", "start_date", "end_date"]

  displayTravellingClimbers() {
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
    fetch('https://jsonplaceholder.typicode.com/todos/1')
    .then(response => response.json())
    .then(json => console.log(json))
  }


  // gets triggered when the user clicks the continue button
  continue() {
    let startDate = flatpickr(search_trip_start_date, {}).selectedDates
    let endDate = flatpickr(search_trip_end_date, {}).selectedDates
    localStorage.setItem("startDate", startDate)
    localStorage.setItem("endDate", endDate)
    console.log(startDate)
    console.log(endDate)
    this.displayTravellingClimbers()
  }
}
