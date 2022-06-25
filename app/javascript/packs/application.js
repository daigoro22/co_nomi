// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import "bootstrap";
import "../stylesheets/application";

window.addEventListener("load", () => {
  const button = document.querySelector("#btn-search");
  const stationName = document.querySelector("#station-name");

  button.addEventListener("click", async (event) => {
    event.preventDefault();
    const query = new URLSearchParams({
      name: stationName.value,
    });
    const response = await fetch(
      `http://express.heartrails.com/api/json?method=getStations&${query}`
    );
    const data = await response.json();
    console.log(data);
  });
});
