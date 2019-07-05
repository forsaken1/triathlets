import React, { Component } from "react";
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import EditTime from "./EditTime.js";
import EditSelect from "./EditSelect.js";
import EditSwitcher from "./EditSwitcher.js";
import { listToSelectOptions, findById } from '../lib/func.js';
import { toggleEditMode, updateResult, deleteResult } from '../redux/actions.js';

import "../styles/Results.scss";

class Result extends Component {
  constructor(props) {
    super(props);

    this.state = {
      id: props.id,
      userId: props.userData.id,
      teamId: props.teamData.id,
      cityId: props.cityData.id,
      time: props.time
    };
    this.handleSaveClick = this.handleSaveClick.bind(this)
    this.handleChangeUser = this.handleChangeUser.bind(this)
    this.handleChangeTeam = this.handleChangeTeam.bind(this)
    this.handleChangeCity = this.handleChangeCity.bind(this)
    this.handleChangeTime = this.handleChangeTime.bind(this)
  }

  handleSaveClick(event) {
    event.preventDefault();

    const { toggleEditMode, editMode, id } = this.props

    if(editMode) {
      const { usersList, teamsList, citiesList, updateResult } = this.props
      const { userId, teamId, cityId, time, id } = this.state
      const payload = {
        id: id,
        user: findById(usersList, userId),
        team: findById(teamsList, teamId),
        city: findById(citiesList, cityId),
        time: time
      }
      updateResult(payload)
    }

    toggleEditMode(id);
  }

  handleDeleteClick(event, id) {
    event.preventDefault();

    this.props.deleteResult(id)
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

  handleChangeTime(value) {
    this.setState({ time: value })
  }

  render() {
    const { editableId, userData, usersList, teamData, teamsList, cityData, citiesList, id } = this.props;
    const { userId, teamId, cityId, time } = this.state;

    const usersOptions = listToSelectOptions(usersList);
    const teamsOptions = listToSelectOptions(teamsList);
    const citiesOptions = listToSelectOptions(citiesList);

    const userOption = usersOptions.find(item => item.value == userId)
    const teamOption = teamsOptions.find(item => item.value == teamId)
    const cityOption = citiesOptions.find(item => item.value == cityId)

    const currentUserOption = userOption || {}
    const currentTeamOption = teamOption || {}
    const currentCityOption = cityOption || {}

    const editMode = editableId == id

    return (
      <div className="result">
        <div className="result-id">{id}</div>
        <EditSelect options={usersOptions} currentOption={currentUserOption} editMode={editMode} onChange={this.handleChangeUser} />
        <EditSelect options={teamsOptions} currentOption={currentTeamOption} editMode={editMode} onChange={this.handleChangeTeam} />
        <EditSelect options={citiesOptions} currentOption={currentCityOption} editMode={editMode} onChange={this.handleChangeCity} />
        <EditTime value={time} editMode={editMode} onChange={this.handleChangeTime} />
        <div className="result-actions">
          <EditSwitcher handler={this.handleSaveClick} status={editMode} />
          <div><button onClick={(event) => { this.handleDeleteClick(event, id)}}>Delete</button></div>
        </div>  
      </div>
    );
  }
}

Result.propTypes = {
  id: PropTypes.number,
  userData: PropTypes.object.isRequired,
  teamData: PropTypes.object.isRequired,
  cityData: PropTypes.object.isRequired,
  time: PropTypes.string
};

const mapStateToProps = ({ editableId, resultsList, usersList, teamsList, citiesList }) => ({
  editableId,
  resultsList,
  usersList,
  teamsList,
  citiesList
});

const mapDispatchToProps = { toggleEditMode, updateResult, deleteResult };

export default connect(mapStateToProps, mapDispatchToProps)(Result);
