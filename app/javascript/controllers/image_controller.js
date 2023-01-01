import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="image"
export default class extends Controller {
  static targets = ['fileInput', 'imagePreview']

  connect() {}

  preview() {
    const [file] = this.fileInputTarget.files || []
    if (file) {
      const fileReader = new FileReader()
      fileReader.onload = (e) => {
        this.imagePreviewTarget.setAttribute('src', e.target.result)
      }

      fileReader.readAsDataURL(file)
    }
  }
}
