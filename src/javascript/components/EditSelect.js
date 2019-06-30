import React, { Component } from "react";
import PropTypes from 'prop-types';
import Select from 'react-select';

class EditSelect extends Component {
  constructor(props) {
    super(props);

    this.state = {
      currentOption: props.currentOption,
      editMode: false
    };
    this.handleClick = this.handleClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleClick(event) {
    event.preventDefault();
    this.setState({editMode: true});
  }

  handleChange(option) {
    this.setState({editMode: false, currentOption: option});
  }

  render() {
    const {currentOption, editMode} = this.state;
    const {options} = this.props;

    return (
      <div className="result-attribute">
        {editMode
          ? <Select value={currentOption} options={options} onChange={this.handleChange} />
          : <div onClick={this.handleClick} className="result-text">{currentOption.label}</div>}
      </div>
    )
  }
}

EditSelect.propTypes = {
  // currentOption: PropTypes.string,
  options: PropTypes.array
}

export default EditSelect;
