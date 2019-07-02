import React, { Component } from "react";
import { connect } from 'react-redux';
import EditField from "./EditField.js";
import EditSelect from "./EditSelect.js";
import { listToSelectOptions, findById } from '../lib/func.js';
import { addResult, toggleEditMode } from '../redux/actions.js';

const defaultState = {
  userId: null,
  teamId: null,
  cityId: null,
  time: null
}

class AddResult extends Component {
  constructor(props) {
    super(props);

    this.state = defaultState;
    this.handleClickAdd = this.handleClickAdd.bind(this);
    this.handleChangeUser = this.handleChangeUser.bind(this);
    this.handleChangeTeam = this.handleChangeTeam.bind(this);
    this.handleChangeCity = this.handleChangeCity.bind(this);
    this.handleChangeTime = this.handleChangeTime.bind(this);
  }

  handleClickAdd(event) {
    event.preventDefault();

    const { addResult, resultsList, usersList, teamsList, citiesList } = this.props;
    const { userId, teamId, cityId, time } = this.state;

    const payload = {
      id: Math.floor(Math.random() * 100000),
      user: findById(usersList, userId),
      team: findById(teamsList, teamId),
      city: findById(citiesList, cityId),
      time: time
    }

    addResult(payload);
    this.setState(defaultState);
  }

  handleChangeUser(value) {
    this.setState({ userId: value });
  }

  handleChangeTeam(value) {
    this.setState({ teamId: value });
  }

  handleChangeCity(value) {
    this.setState({ cityId: value });
  }

  handleChangeTime(event) {
    this.setState({ time: event.target.value })
  }

  render() {
    const { usersList, teamsList, citiesList } = this.props;

    const usersOptions = listToSelectOptions(usersList);
    const teamsOptions = listToSelectOptions(teamsList);
    const citiesOptions = listToSelectOptions(citiesList);

    return (
      <div className="result">
        <div className="result-attribute result-id"></div>
        <EditSelect options={usersOptions} currentOption={{}} editMode={true} onChange={this.handleChangeUser} />
        <EditSelect options={teamsOptions} currentOption={{}} editMode={true} onChange={this.handleChangeTeam} />
        <EditSelect options={citiesOptions} currentOption={{}} editMode={true} onChange={this.handleChangeCity} />
        <EditField val={''} editMode={true} onChange={this.handleChangeTime} />
        <div><button onClick={this.handleClickAdd}>Add</button></div>
      </div>
    )
  }
}

const mapStateToProps = ({ resultsList, usersList, teamsList, citiesList }) => ({
  resultsList,
  usersList,
  teamsList,
  citiesList
});

const mapDispatchToProps = { addResult };

export default connect(mapStateToProps, mapDispatchToProps)(AddResult);