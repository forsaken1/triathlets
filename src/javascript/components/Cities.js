import React, { Component } from "react"
import { connect } from 'react-redux'
import { fetchCities } from '../redux/actions'
import * as Route from '../lib/routes'

class Cities extends Component {
  componentDidMount() {
    const { fetchCities } = this.props

    fetchCities()
  }

  render() {
    const { citiesList } = this.props

    return (
      <>
        <h1>Города</h1>
        <div className="users">
          {citiesList.map(user => <div key={user.id}>{user.name}</div>)}
        </div>
      </>
    )
  }
}

const mapStateToProps = ({ citiesList }) => ({
  citiesList
})

const mapDispatchToProps = {
  fetchCities
}

export default connect(mapStateToProps, mapDispatchToProps)(Cities)
