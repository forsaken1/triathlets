import React, { Component } from "react";

class EditField extends Component {
  constructor(props) {
    super(props);

    this.state = {
      val: props.val,
      editMode: false
    };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    event.preventDefault();
    this.setState({editMode: true});
  }

  render() {
    return (
      <div className="result-field city-field" onClick={this.handleClick} >
        {this.state.editMode
          ? <><input value={this.state.val} /><button>Save</button></>
          : this.state.val}
      </div>
    )
  }
}

export default EditField;
