import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { conversationId: Number, userName: String }
  static targets = ["messages"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ConversationChannel", id: this.conversationIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  // #insertMessageAndScrollDown(data) {
  //   this.messagesTarget.insertAdjacentHTML("beforeend", data)
  //   this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  // }

  #insertMessageAndScrollDown(data) {
    let newData = "";
    if (data.includes(`<h6>${this.userNameValue}</h6>`)) {
      newData = data;
    } else {
      newData = data.replace("sender-message", "receiver-message");
    }
    this.messagesTarget.insertAdjacentHTML("beforeend", newData);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }

  resetForm(event) {
    event.target.reset()
  }
}
