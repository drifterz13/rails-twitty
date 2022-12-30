import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ['toast']

  connect() {
    console.log('flash connected.')
    this.toast = bootstrap.Toast.getOrCreateInstance(this.toastTarget)
    this.toast.show()
  }
}
