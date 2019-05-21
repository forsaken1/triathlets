import React from "react";
import ReactDOM from "react-dom";
import Race from "./components/Race.js";

const reactRaceEntrypoint = document.getElementById("react-race-entrypoint");

if(reactRaceEntrypoint) {
  const id = reactRaceEntrypoint.getAttribute('race-id');
  ReactDOM.render(<Race id={id} />, reactRaceEntrypoint);
}
