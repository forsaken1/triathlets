import React, { Component } from "react";
import PropTypes from 'prop-types';

class EditField extends Component {
  constructor(props) {
    super(props);

    this.state = {
      val: props.val,
      editMode: false
    };
    this.handleClick = this.handleClick.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleClick(event) {
    event.preventDefault();
    this.setState({editMode: true});
  }

  handleSubmit(event) {
    event.preventDefault();
    this.setState({editMode: false});
  }

  render() {
    const {val, editMode} = this.state;

    return (
      <div className="result-attribute">
        {editMode
          ? <><input className="result-input" defaultValue={val} /><button className="result-button-save" onClick={this.handleSubmit}>Save</button></>
          : <div onClick={this.handleClick} className="result-text">{val}</div>}
      </div>
    )
  }
}

EditField.propTypes = {
  val: PropTypes.string
}

export default EditField;
