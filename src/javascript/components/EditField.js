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
    const { editMode, onChange } = this.props;

    return (
      <div className="result-attribute">
        {editMode
          ? <input className="result-input" defaultValue={val} onChange={onChange} />
          : <div className="result-text">{val}</div>}
      </div>
    )
  }
}

EditField.propTypes = {
  val: PropTypes.string,
  editMode: PropTypes.bool.isRequired,
  onChange: PropTypes.func
}

export default EditField;
