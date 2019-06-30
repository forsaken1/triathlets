import React, { Component } from "react";
import PropTypes from 'prop-types';

class EditField extends Component {
  constructor(props) {
    super(props);

    this.state = {
      val: props.val
    };
  }

  render() {
    const { val } = this.state;
    const { editMode } = this.props;

    return (
      <div className="result-attribute">
        {editMode
          ? <input className="result-input" defaultValue={val} />
          : <div className="result-text">{val}</div>}
      </div>
    )
  }
}

EditField.propTypes = {
  val: PropTypes.string,
  editMode: PropTypes.bool.isRequired
}

export default EditField;
