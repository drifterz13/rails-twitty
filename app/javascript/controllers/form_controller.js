import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="form"
export default class extends Controller {
  connect() {
    console.log('form connected,')
  }

  reset() {
    this.element.reset()
  }
}
