import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="snackbar"
export default class extends Controller {
  connect() {
    console.log("teste")
  }
}
