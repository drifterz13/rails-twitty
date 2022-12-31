import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    console.log('flash connected.')

    setTimeout(() => {
      this.element.classList.add('hidden')
    }, 3000)
  }
}
