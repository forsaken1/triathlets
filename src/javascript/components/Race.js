import React, { Component } from "react";
import PropTypes from 'prop-types';
import Results from "./Results.js";
import * as Route from '../lib/routes.js';

class Race extends Component {
  constructor(props) {
    super(props);

    this.state = {
      raceResults: [],
      usersList: []
    };
  }

  getRaceResult() {
    fetch(Route.resultsPath(this.props.id))
      .then(response => response.json())
      .then(data => this.setState({raceResults: data}));
  }

  getUsers() {
    fetch(Route.usersPath(this.props.id))
      .then(response => response.json())
      .then(data => this.setState({usersList: data}));
  }

  componentDidMount() {
    this.getRaceResult();
    this.getUsers();
  }

  render() {
    const {usersList, raceResults} = this.state;

    return (
      <div>
        {raceResults.map(result => <Results id={result.id}
                                            userData={result.user}
                                            usersList={usersList}
                                            cityName={result.city.name}
                                            teamName={result.team.name}
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
