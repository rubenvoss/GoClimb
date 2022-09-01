import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-dates"
export default class extends Controller {
  continue() {
    event.preventDefault();
    console.log("you pressed submit")
    // save trip_start_date
    // save trip_end_date
    // preventDefault
    let tripEndDate = document.getElementById('search_trip_end_date')
    let tripStartDate = document.getElementById('search_trip_start_date')
    let startDate = flatpickr(search_trip_start_date, {}).selectedDates
    let endDate = flatpickr(search_trip_end_date, {}).selectedDates
    console.log(startDate[0])
    console.log(endDate[0])


  }

}
