import React, { Component } from "react";
import PropTypes from 'prop-types';
import EditField from "./EditField.js";

import "../styles/Results.css"

class Results extends Component {
  render() {
    const {userName, teamName, cityName, id, time} = this.props;

    return (
      <div className="result">
        <div className="result-field result-id">{id}</div>
        <EditField val={userName} />
        <EditField val={teamName} />
        <EditField val={cityName} />
        <EditField val={time} />
      </div>
    );
  }
}

Results.propTypes = {
  id: PropTypes.number,
  userName: PropTypes.string,
  teamName: PropTypes.string,
  cityName: PropTypes.string,
  time: PropTypes.string
};

export default Results;
