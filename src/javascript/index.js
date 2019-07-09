import React from "react"
import ReactDOM from "react-dom"
import { Provider } from 'react-redux'
import { BrowserRouter as Router, Route } from 'react-router-dom'
import Race from "./components/Race"
import Races from "./components/Races"
import Users from "./components/Users"
import store from './redux/store'

const reactAdminDashboardEntrypoint = document.getElementById("react-admin-dashboard-entrypoint")

if(reactAdminDashboardEntrypoint) {
  ReactDOM.render(
    <Provider store={store}>
      <Router>
        <Route path="/admin" exact component={Races} />
        <Route path="/admin/users" component={Users} />
        <Route path="/admin/races/:id" render={(props) => <Race {...props} />} />
      </Router>
    </Provider>,
    reactAdminDashboardEntrypoint
  )
}
