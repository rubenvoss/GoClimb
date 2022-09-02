import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["start", "end", "input", "list", "form"]
  update() {
    // console.log("value: " + this.inputTarget.value)
    // console.log("list: " + this.listTarget)
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&start_date=${this.startTarget.value}&end_date=${this.endTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = " "
        this.listTarget.innerHTML = data
        // console.log(data)
      })
  }

}
