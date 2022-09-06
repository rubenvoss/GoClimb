import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static targets = ["inbox"]
  static values = { userId: Number }

  connect() {
    console.log(this.inboxTarget)
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue },
      { received: data => {
        this.inboxTarget.innerHTML = ""
        this.inboxTarget.insertAdjacentHTML("beforeend", data.notification)
      }}
    )
  }
}
