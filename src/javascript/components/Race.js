import React, { Component } from "react";
import PropTypes from 'prop-types';
import Results from "./Results.js";
import * as Route from '../lib/routes.js';

class Race extends Component {
  constructor(props) {
    super(props);

    this.state = {
      resultsList: [],
      usersList: [],
      citiesList: [],
      teamsList: []
    };
  }

  getRaceResult() {
    fetch(Route.resultsPath(this.props.id))
      .then(response => response.json())
      .then(data => this.setState({resultsList: data}));
  }

  getUsers() {
    fetch(Route.usersPath())
      .then(response => response.json())
      .then(data => this.setState({usersList: data}));
  }

  getTeams() {
    fetch(Route.teamsPath())
      .then(response => response.json())
      .then(data => this.setState({teamsList: data}));
  }

  getCities() {
    fetch(Route.citiesPath())
      .then(response => response.json())
      .then(data => this.setState({citiesList: data}));
  }

  componentDidMount() {
    this.getRaceResult();
    this.getUsers();
    this.getTeams();
    this.getCities();
  }

  render() {
    const {usersList, teamsList, citiesList, resultsList} = this.state;

    return (
      <div>
        {resultsList.map(result => <Results id={result.id}
                                        userData={result.user}
                                        usersList={usersList}

                                        cityData={result.city}
                                        citiesList={citiesList}

                                        teamData={result.team}
                                        teamsList={teamsList}

                                        time={result.time}
                                        key={result.id} />)}
      </div>
    );
  }
}

Race.propTypes = {
  id: PropTypes.string.isRequired,
}

export default Race;
