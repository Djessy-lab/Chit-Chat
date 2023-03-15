import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "form"]

  connect() {
    this.scrollToEndMessages()
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(this.channel);
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
    this.scrollToEndMessages()
    // this.formTarget.scrollIntoView({block: "end", behavior: "smooth"})
  }

  scrollToEndMessages() {
    this.messagesTarget.scrollTo({top: this.messagesTarget.scrollHeight, behavior: "smooth"})
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
