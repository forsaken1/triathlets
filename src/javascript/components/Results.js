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
    const {userData, usersList, teamName, cityName, id, time} = this.props;
    const { editMode } = this.state;
    const userOptions = listToSelectOptions(usersList);
    const currentUserOption = { value: userData.id, label: userData.name };
    const currentTeamOption = { label: teamName };
    const currentCityOption = { label: cityName };

    return (
      <div className="result">
        <div className="result-attribute result-id">{id}</div>
        <EditSelect options={userOptions} currentOption={currentUserOption} editMode={editMode} />
        <EditSelect currentOption={currentTeamOption} editMode={editMode} />
        <EditSelect currentOption={currentCityOption} editMode={editMode} />
        <EditField val={time} editMode={editMode} />
        <EditSwitcher handler={this.handleClick} status={editMode} />
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
