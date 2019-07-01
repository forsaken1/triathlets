import React, { Component } from "react";
import PropTypes from 'prop-types';
import EditField from "./EditField.js";
import EditSelect from "./EditSelect.js";
import EditSwitcher from "./EditSwitcher.js";
import { listToSelectOptions } from '../lib/func.js';

import "../styles/Results.scss";

class Results extends Component {
  constructor(props) {
    super(props);

    this.state = {
      editMode: false
    };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    event.preventDefault();
    const { editMode } = this.state;
    this.setState({ editMode: !editMode });
  }

  render() {
    const { userData, usersList, teamData, teamsList, cityData, citiesList, id, time } = this.props;
    const { editMode } = this.state;

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

export default Results;
