import React, { Component } from "react";
import PropTypes from 'prop-types';
import * as moment from 'moment';
import TimePicker from 'rc-time-picker';
import 'rc-time-picker/assets/index.css';

class EditTime extends Component {
  constructor(props) {
    super(props);

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(value) {
    const { onChange } = this.props

    if(onChange) {
      onChange(value ? value.format(moment.HTML5_FMT.TIME_SECONDS) : '0:00:00');
    }
  }

  render() {
    const { editMode, value } = this.props;

    return (
      <div className="result-attribute">
        {editMode
          ? <TimePicker onChange={this.handleChange} defaultValue={moment(value, moment.HTML5_FMT.TIME_SECONDS)} />
          : <div className="result-text">{value}</div>}
      </div>
    )
  }
}

EditTime.propTypes = {
  val: PropTypes.string,
  editMode: PropTypes.bool.isRequired,
  onChange: PropTypes.func.isRequired
}

export default EditTime;
