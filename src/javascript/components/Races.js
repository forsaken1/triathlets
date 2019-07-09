import React, { Component } from "react"
import { NavLink } from 'react-router-dom'
import { connect } from 'react-redux'
import { fetchRaces } from '../redux/actions'
import * as Route from '../lib/routes'

class Races extends Component {
  componentDidMount() {
    const { fetchRaces } = this.props

    fetchRaces()
  }

  render() {
    const { racesList } = this.props

    return (
      <>
        <h1>Триатлоны</h1>
        <div className="races">
          {racesList.map(race => <div key={race.id}><NavLink to={`/admin/races/${race.id}`}>{race.title}</NavLink></div>)}
        </div>
      </>
    )
  }
}

const mapStateToProps = ({ racesList }) => ({
  racesList
})

const mapDispatchToProps = (dispatch) => {
  return {
    fetchRaces: () => {
      fetch(Route.racesPath())
        .then(response => response.json())
        .then(data => dispatch(fetchRaces(data)))
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Races)
