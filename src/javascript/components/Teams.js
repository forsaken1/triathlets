import React, { Component } from "react"
import { connect } from 'react-redux'
import { fetchTeams } from '../redux/actions'
import * as Route from '../lib/routes'

class Teams extends Component {
  componentDidMount() {
    const { fetchTeams } = this.props

    fetchTeams()
  }

  render() {
    const { teamsList } = this.props

    return (
      <>
        <h1>Команды</h1>
        <div className="users">
          {teamsList.map(user => <div key={user.id}>{user.name}</div>)}
        </div>
      </>
    )
  }
}

const mapStateToProps = ({ teamsList }) => ({
  teamsList
})

const mapDispatchToProps = {
  fetchTeams
}

export default connect(mapStateToProps, mapDispatchToProps)(Teams)
