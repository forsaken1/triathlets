import React, { Component } from "react";
import PropTypes from 'prop-types';
import Results from "./Results.js"
import * as Route from '../lib/routes.js'

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
    fetch(Route.results_path(this.props.id))
      .then(response => response.json())
      .then(data => this.setState({results: data}));
  }

  render() {
    return (
      <div>
        {this.state.results.map(result => <Results id={result.id} userName={result.user.name} cityName={result.city.name} teamName={result.team.name} time={result.time} key={result.id} />)}
      </div>
    );
  }
}

Race.propTypes = {
  id: PropTypes.string.isRequired,
}

export default Race;
