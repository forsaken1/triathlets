import React, { Component } from "react";
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import Result from "./Result.js";
import AddResult from "./AddResult.js";
import * as Route from '../lib/routes.js';
import { fetchResults, fetchCities, fetchUsers, fetchTeams } from '../redux/actions.js';

class Race extends Component {
  constructor(props) {
    super(props)

    this.state = {
      currentRace: null
    }
  }

  fetchRace(id) {
    fetch(Route.racePath(id))
      .then(response => response.json())
      .then(data => this.setState({ currentRace: data }))
  }

  componentDidMount() {
    const { match: { params } } = this.props

    this.fetchRace(params.id)
    this.props.fetchResults(params.id)
    this.props.fetchCities()
    this.props.fetchUsers()
    this.props.fetchTeams()
  }

  render() {
    const { racesList, resultsList, usersList, teamsList, citiesList } = this.props
    const { currentRace } = this.state

    return (
      <>
        <h1>{currentRace && currentRace.title}</h1>
        <AddResult usersList={usersList} citiesList={citiesList} teamsList={teamsList} />

        {resultsList.map(result => <Result id={result.id}
                                        userData={result.user}
                                        usersList={usersList}

                                        cityData={result.city}
                                        citiesList={citiesList}

                                        teamData={result.team}
                                        teamsList={teamsList}

                                        time={result.time}
                                        key={result.id} />)}
      </>
    );
  }
}

const mapStateToProps = ({ racesList, resultsList, usersList, teamsList, citiesList }) => ({
  racesList,
  resultsList,
  usersList,
  teamsList,
  citiesList
});

const mapDispatchToProps = (dispatch) => {
  return {
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
