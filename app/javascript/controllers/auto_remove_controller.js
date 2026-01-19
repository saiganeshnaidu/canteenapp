import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { time: Number }

  connect() {
    setTimeout(() => {
      this.element.remove()
    }, this.timeValue || 3000)
  }
}
