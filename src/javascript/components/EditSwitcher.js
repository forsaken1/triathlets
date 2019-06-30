import React, { Component } from "react";
import PropTypes from 'prop-types';
import Select from 'react-select';

class EditSwitcher extends Component {
  render() {
    const { handler, status } = this.props;

    return (
      <div className="result-switcher">
        {status
          ? <button className="result-switcher__button result-switcher__button--on" onClick={handler}>Save</button>
          : <button className="result-switcher__button result-switcher__button--off" onClick={handler}>Edit</button>}
      </div>
    )
  }
}

EditSwitcher.propTypes = {
  handler: PropTypes.func.isRequired,
  status: PropTypes.bool.isRequired
}

export default EditSwitcher;
