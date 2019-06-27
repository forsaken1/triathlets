import React, { Component } from "react";
import PropTypes from 'prop-types';
import EditField from "./EditField.js";

import "../styles/Results.css"

class Results extends Component {
  render() {
    const {user, team, city, id, time} = this.props;

    return (
      <div className="result">
        <div className="result-field">{id}</div>
        <EditField val={user.name} />
        <EditField val={team.name} /> 
        <EditField val={city.name} />
        <div className="result-field">{time}</div>
      </div>
    );
  }
}

Results.propTypes = {
  id: PropTypes.number
};

export default Results;
