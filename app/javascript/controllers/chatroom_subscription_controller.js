import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "form"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  resetForm(event) {
    console.log("hello");
    event.target.reset()
  }

  #insertMessageAndScrollDown(data) {
    console.log(data);
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    console.log(this.messagesTarget);
    // this.messagesTarget.scrollTo({top: this.messagesTarget.scrollHeight, behavio: "smooth"})
    this.formTarget.scrollIntoView({block: "end", behavior: "smooth"})
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
