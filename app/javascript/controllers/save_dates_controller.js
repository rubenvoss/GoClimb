import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-dates"
export default class extends Controller {
  continue() {
    console.log("you pressed submit")
    // save trip_start_date
    // save trip_end_date
    // preventDefault

  }
}
