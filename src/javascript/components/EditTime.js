import React, { Component } from "react";
import PropTypes from 'prop-types';
import * as moment from 'moment';
import TimePicker from 'rc-time-picker';
import 'rc-time-picker/assets/index.css';

class EditTime extends Component {
  constructor(props) {
    super(props);

    this.state = {
      val: props.val
    };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(value) {
    this.setState({ val: value.format(moment.HTML5_FMT.TIME_SECONDS) });
    this.props.onChange(this.state.val);
  }

  render() {
    const { val } = this.state;
    const { editMode } = this.props;

    return (
      <div className="result-attribute">
        {editMode
          ? <TimePicker onChange={this.handleChange} defaultValue={moment(val, moment.HTML5_FMT.TIME_SECONDS)} />
          : <div className="result-text">{val}</div>}
      </div>
    )
  }
}

EditTime.propTypes = {
  val: PropTypes.string,
  editMode: PropTypes.bool.isRequired,
  onChange: PropTypes.func
}

export default EditTime;
