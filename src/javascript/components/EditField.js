import React, { Component } from "react";

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
    return (
      <div className="result-field" onClick={this.handleClick} >
        {this.state.editMode
          ? <><input value={this.state.val} /><button onClick={this.handleSubmit}>Save</button></>
          : this.state.val}
      </div>
    )
  }
}

export default EditField;
