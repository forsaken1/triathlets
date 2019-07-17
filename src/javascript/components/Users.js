import React, { Component } from "react"
import { connect } from 'react-redux'
import { addUser, fetchUsers } from '../redux/actions'
import * as Route from '../lib/routes'

class Users extends Component {
  componentDidMount() {
    const { fetchUsers } = this.props

    fetchUsers()
  }

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
  addUser,
  fetchUsers
}

export default connect(mapStateToProps, mapDispatchToProps)(Users)
