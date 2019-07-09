import React, { Component } from "react"
import { connect } from 'react-redux'

class Users extends Component {
  render() {
    return (
      <div className="users">
      </div>
    )
  }
}

const mapStateToProps = ({ usersList }) => ({
  usersList
});

const mapDispatchToProps = (dispatch) => {
  addUser
};

export default connect(mapStateToProps, mapDispatchToProps)(Users)
