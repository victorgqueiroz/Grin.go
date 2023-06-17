import { Application } from "@hotwired/stimulus"
require("toastify-js")
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
