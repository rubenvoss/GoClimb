import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "list", "form"]
  connect() {
    console.log("controller search connected")
  }
  update() {
    console.log("TODO: send request in AJAX")
    // console.log("value: " + this.inputTarget.value)
    // console.log("list: " + this.listTarget)
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = " "
        this.listTarget.innerHTML = data
        // console.log(data)
      })
  }

}
