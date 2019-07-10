import React, { Component } from "react"
import { connect } from 'react-redux'
import { addUser } from '../redux/actions'

class Users extends Component {
  render() {
    const { usersList } = this.props

    return (
      <>
        <h1>Спортсмены</h1>
        <div className="users">
          {usersList.map(user => <div key={user.id}>{user.name}</div>)}
        </div>
      </>
    )
  }
}

const mapStateToProps = ({ usersList }) => ({
  usersList
})

const mapDispatchToProps = {
  addUser
}

export default connect(mapStateToProps, mapDispatchToProps)(Users)
