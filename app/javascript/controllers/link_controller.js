import { Controller } from '@hotwired/stimulus'
import { Turbo } from '@hotwired/turbo-rails'

// Connects to data-controller="link"
export default class extends Controller {
  static targets = ['click']

  connect() {
    this.element.addEventListener('click', this.handleClick)
    this.clickTargets.forEach((clickTarget) => {
      clickTarget.addEventListener('click', this.handleClick)
    })
  }

  disconnect() {
    this.element.addEventListener('click', this.handleClick)
    this.clickTargets.forEach((clickTarget) => {
      clickTarget.removeEventListener('click', this.handleClick)
    })
  }

  handleClick(e) {
    e.stopPropagation()
  }

  to() {
    const url = this.element.dataset.url
    Turbo.visit(url, { action: 'replace' })
  }
}
