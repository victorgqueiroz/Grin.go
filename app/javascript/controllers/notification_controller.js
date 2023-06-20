import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import Toastify from 'toastify-js'

// Connects to data-controller="notification"
export default class extends Controller {
  static values = { userId: Number }

  connect() {
    console.log(`conectou no notification ${this.userIdValue}`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue },
      { received: data => this.notify(data) }
    )
  }

  notify(data) {
    console.log(data)

    Toastify({
      text: `Nova mensagem de ${data.name}: ${data.content}...`,
      duration: 10000,
      destination: `chatrooms/${data.chatroom_id}`
    }).showToast();

  }
}
