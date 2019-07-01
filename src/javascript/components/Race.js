import React, { Component } from "react";
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import Results from "./Results.js";
import AddResult from "./AddResult.js";
import * as Route from '../lib/routes.js';
import { addResult, fetchResults, fetchCities, fetchUsers, fetchTeams } from '../redux/actions.js';

class Race extends Component {
  componentDidMount() {
    this.props.fetchResults(this.props.id);
    this.props.fetchCities();
    this.props.fetchUsers();
    this.props.fetchTeams();
  }

  render() {
    const { resultsList, usersList, teamsList, citiesList } = this.props;

    return (
      <div>
        <AddResult usersList={usersList} citiesList={citiesList} teamsList={teamsList} />

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

const mapStateToProps = ({ resultsList, usersList, teamsList, citiesList }) => ({
  resultsList,
  usersList,
  teamsList,
  citiesList
});

const mapDispatchToProps = (dispatch) => {
  return {
    addResult,
    fetchResults: (raceId) => {
      fetch(Route.resultsPath(raceId))
        .then(response => response.json())
        .then(data => dispatch(fetchResults(data)))
    },
    fetchCities: () => {
      fetch(Route.citiesPath())
        .then(response => response.json())
        .then(data => dispatch(fetchCities(data)))
    },
    fetchUsers: () => {
      fetch(Route.usersPath())
        .then(response => response.json())
        .then(data => dispatch(fetchUsers(data)))
    },
    fetchTeams: () => {
      fetch(Route.teamsPath())
        .then(response => response.json())
        .then(data => dispatch(fetchTeams(data)))
    }
  }
};

export default connect(mapStateToProps, mapDispatchToProps)(Race);
