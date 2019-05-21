import React, { Component } from "react";
import Result from "./Result.js"

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
        {this.state.results.map(result => <Result data={result} key={result.id} />)}
      </div>
    );
  }
}

export default Race;
