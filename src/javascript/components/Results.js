import React, { Component } from "react";
import PropTypes from 'prop-types';
import EditField from "./EditField.js";
import EditSelect from "./EditSelect.js";
import { listToSelectOptions } from '../lib/func.js';

import "../styles/Results.css"

class Results extends Component {
  render() {
    const {userData, usersList, teamName, cityName, id, time} = this.props;
    const userOptions = listToSelectOptions(usersList);
    const currentUserOption = { value: userData.id, label: userData.name };
    const currentTeamOption = { label: teamName };
    const currentCityOption = { label: cityName };

    return (
      <div className="result">
        <div className="result-attribute result-id">{id}</div>
        <EditSelect options={userOptions} currentOption={currentUserOption} />
        <EditSelect currentOption={currentTeamOption} />
        <EditSelect currentOption={currentCityOption} />
        <EditField val={time} />
      </div>
    );
  }
}

Results.propTypes = {
  id: PropTypes.number,
  // user: PropTypes.string.isRequired,
  teamName: PropTypes.string.isRequired,
  cityName: PropTypes.string.isRequired,
  time: PropTypes.string
};

export default Results;
