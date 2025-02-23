import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submitter"
export default class extends Controller {
  // data-form-submitter-target="button"
  static targets = [ "button" ]

  // data-action="click->form-submitter#submit"
  submit() {
    console .log("Form submitter controller connected")

    this.buttonTarget.click()
  }
}

