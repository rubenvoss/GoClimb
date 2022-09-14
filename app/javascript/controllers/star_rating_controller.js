import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"

// Connects to data-controller="star-rating"
export default class extends Controller {
  static targets = [ "stars" ]

  connect() {
    new StarRating(this.element),
    new StarRating(this.starsTarget.value)
  }
}
