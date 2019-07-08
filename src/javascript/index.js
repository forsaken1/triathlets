import React from "react";
import ReactDOM from "react-dom";
import { Provider } from 'react-redux';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Race from "./components/Race.js";
import store from './redux/store'

const reactRaceEntrypoint = document.getElementById("react-race-entrypoint");

if(reactRaceEntrypoint) {
  const id = reactRaceEntrypoint.getAttribute('race-id');

  ReactDOM.render(
    <Provider store={store}>
      <Router>
        <Route path="/" render={(props) => <Race {...props} id={id} />} />
      </Router>
    </Provider>,
    reactRaceEntrypoint
  )
}
