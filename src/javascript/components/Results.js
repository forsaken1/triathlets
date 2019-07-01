import React, { Component } from "react";
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import EditField from "./EditField.js";
import EditSelect from "./EditSelect.js";
import EditSwitcher from "./EditSwitcher.js";
import { listToSelectOptions } from '../lib/func.js';
import { toggleEditMode } from '../redux/actions.js';

import "../styles/Results.scss";

class Results extends Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    event.preventDefault();
    this.props.toggleEditMode();
  }

  render() {
    const { editMode, userData, usersList, teamData, teamsList, cityData, citiesList, id, time } = this.props;

    const usersOptions = listToSelectOptions(usersList);
    const teamsOptions = listToSelectOptions(teamsList);
    const citiesOptions = listToSelectOptions(citiesList);

    const currentUserOption = { value: userData.id, label: userData.name };
    const currentTeamOption = { value: teamData.id, label: teamData.name };
    const currentCityOption = { value: cityData.id, label: cityData.name };

    return (
      <div className="result">
        <div className="result-attribute result-id">{id}</div>
        <EditSelect options={usersOptions} currentOption={currentUserOption} editMode={editMode} />
        <EditSelect options={teamsOptions} currentOption={currentTeamOption} editMode={editMode} />
        <EditSelect options={citiesOptions} currentOption={currentCityOption} editMode={editMode} />
        <EditField val={time} editMode={editMode} />
        <EditSwitcher handler={this.handleClick} status={editMode} />
      </div>
    );
  }
}

Results.propTypes = {
  id: PropTypes.number,
  userData: PropTypes.object.isRequired,
  teamData: PropTypes.object.isRequired,
  cityData: PropTypes.object.isRequired,
  time: PropTypes.string
};

const mapStateToProps = ({ editMode }) => ({
  editMode
});

const mapDispatchToProps = { toggleEditMode };

export default connect(mapStateToProps, mapDispatchToProps)(Results);
