import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { conversationId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ConversationChannel", id: this.conversationIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data) }
    )

    console.log(`Subscribed to the chatroom with the id ${this.conversationIdValue}.`)
  }
}
