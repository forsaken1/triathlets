import React, { Component } from "react";
import PropTypes from 'prop-types';
import Select from 'react-select';

class EditSelect extends Component {
  constructor(props) {
    super(props);

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(option) {
    this.props.onChange(option.value);
  }

  render() {
    const { options, editMode, hasError, currentOption } = this.props;
    const blockClassName = hasError ? 'result-attribute result-attribute--has-error' : 'result-attribute'

    return (
      <div className={blockClassName}>
        {editMode
          ? <Select value={currentOption} options={options} onChange={this.handleChange} inputReadOnly />
          : <div className="result-text">{currentOption.label}</div>}
      </div>
    )
  }
}

EditSelect.propTypes = {
  currentOption: PropTypes.object,
  options: PropTypes.array,
  editMode: PropTypes.bool.isRequired,
  onChange: PropTypes.func.isRequired
}

export default EditSelect;
