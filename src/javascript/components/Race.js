import React, { Component } from "react";
import Results from "./Results.js"

const RESULTS_API = "/admin/results.json?race_id="

class Race extends Component {
  constructor(props) {
    super(props);

    this.state = {
      id: props.id,
      data: null,
      results: []
    };
  }

  componentDidMount() {
    fetch(RESULTS_API + this.props.id)
      .then(response => response.json())
      .then(data => this.setState({results: data}));
  }

  render() {
    return (
      <div>
        {this.state.results.map(result => <Results id={result.id} user={result.user} city={result.city} team={result.team} time={result.time} key={result.id} />)}
      </div>
    );
  }
}

export default Race;
