import React, { Component } from "react";
import EditField from "./EditField.js";
import EditSelect from "./EditSelect.js";
import { listToSelectOptions } from '../lib/func.js';

class AddResult extends Component {
  handleClickAdd(event) {
    event.preventDefault();
    
  }

  render() {
    const { usersList, teamsList, citiesList } = this.props;

    const usersOptions = listToSelectOptions(usersList);
    const teamsOptions = listToSelectOptions(teamsList);
    const citiesOptions = listToSelectOptions(citiesList);

    return (
      <div className="result">
        <div className="result-attribute result-id"></div>
        <EditSelect options={usersOptions} currentOption={{}} editMode={true} />
        <EditSelect options={teamsOptions} currentOption={{}} editMode={true} />
        <EditSelect options={citiesOptions} currentOption={{}} editMode={true} />
        <EditField val={''} editMode={true} />
        <div><button onClick={this.handleClickAdd}>Add</button></div>
      </div>
    )
  }
}

export default AddResult;