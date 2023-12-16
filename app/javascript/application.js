// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";
import "popper.js";
import "./timezone_detect.js";

document.addEventListener("turbolinks:load", function () {
  $('[data-bs-toggle="modal"]').modal();
});
