import React, { Component } from "react";
import PropTypes from 'prop-types';
import Select from 'react-select';

class EditSelect extends Component {
  constructor(props) {
    super(props);

    this.state = {
      currentOption: props.currentOption
    };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(option) {
    this.setState({currentOption: option});
    this.props.onChange(option.value);
  }

  render() {
    const { currentOption } = this.state;
    const { options, editMode } = this.props;

    return (
      <div className="result-attribute">
        {editMode
          ? <Select value={currentOption} options={options} onChange={this.handleChange} />
          : <div className="result-text">{currentOption.label}</div>}
      </div>
    )
  }
}

EditSelect.propTypes = {
  currentOption: PropTypes.object,
  options: PropTypes.array,
  editMode: PropTypes.bool.isRequired,
  onChange: PropTypes.func
}

export default EditSelect;
