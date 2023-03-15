import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
static values = {receiverId: Number}
static targets = ["notifButton", "notifIndex"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel" },
      { received: data => {
        this.#addNotificationToIndex(data);
        this.#addNotificationToButton(data)
      } }
    )
  }

  #addNotificationToIndex(data) {
    const chatroomId = data.chatroom.toString()
    const conversations = this.notifIndexTargets
    conversations.forEach((conversation) => {
      const conversationId = conversation.dataset.chatroomId
      console.log(conversation)
      if (conversationId === chatroomId) {
        conversation.innerText = " "
      }
    })

  }

  #addNotificationToButton(data) {
    const button = this.notifButtonTarget
    button.innerText = " "
  }

}
