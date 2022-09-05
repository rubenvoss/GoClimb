import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-trip"
export default class extends Controller {
  static targets = ["infos", "tripform", "card"]
  connect() {
  }

  displayForm() {
    this.infosTarget.classList.add("d-none")
    this.tripformTarget.classList.remove("d-none")
  }

  update(event) {
    event.preventDefault()
    const url = this.tripformTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.tripformTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.tripformTarget.classList.add("d-none")
        this.infosTarget.classList.remove("d-none")
        this.infosTarget.outerHTML = data
      })
  }
}
