import React, { Component } from "react";

class Team extends Component {
  constructor(props) {
    super(props);

    this.state = {
      data: props.data,
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
      <div className="result-field user-field" onClick={this.handleClick} >
        {this.state.editMode
          ? <input value={this.state.data.name} />
          : this.state.data.name}
      </div>
    )
  }
}

export default Team;
