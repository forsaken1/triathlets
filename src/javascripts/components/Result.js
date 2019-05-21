import React, { Component } from "react";
import User from "./User.js"
import City from "./City.js"
import Team from "./Team.js"

import "../styles/Result.css"

class Result extends Component {
  constructor(props) {
    super(props);

    this.state = {
      data: props.data
    };
  }

  render() {
    return (
      <div className="result">
        <div className="result-field">{this.state.data.id}</div>
        <User data={this.state.data.user} />
        <Team data={this.state.data.team} />
        <City data={this.state.data.city} />
        <div className="result-field">{this.state.data.time}</div>
      </div>
    );
  }
}

export default Result;
