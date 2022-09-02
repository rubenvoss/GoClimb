import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-dates"
export default class extends Controller {
  continue() {
    event.preventDefault();
    console.log("you pressed submit")
    // save trip_start_date
    // save trip_end_date
    // preventDefault
    // let tripEndDate = document.getElementById('search_trip_end_date')
    // let tripStartDate = document.getElementById('search_trip_start_date')
    this.startDate = flatpickr(search_trip_start_date, {}).selectedDates
    this.endDate = flatpickr(search_trip_end_date, {}).selectedDates
    console.log(this.startDate[0])
    console.log(this.endDate[0])
  }

  show() {
    console.log(this)
    console.log(this.startDate)
    console.log(this.endDate)
  }
}
