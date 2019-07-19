import React, { Component } from "react"
import { connect } from 'react-redux'
import EditTime from "./EditTime.js"
import EditSelect from "./EditSelect.js"
import { listToSelectOptions, findById } from '../lib/func.js'
import { addResult, toggleEditMode } from '../redux/actions.js'

const defaultState = {
  userId: null,
  teamId: null,
  cityId: null,
  time: '0:00:00',
  hasError: false
}

class AddResult extends Component {
  constructor(props) {
    super(props)

    this.state = defaultState;
    this.handleClickAdd = this.handleClickAdd.bind(this)
    this.handleChangeUser = this.handleChangeUser.bind(this)
    this.handleChangeTeam = this.handleChangeTeam.bind(this)
    this.handleChangeCity = this.handleChangeCity.bind(this)
    this.handleChangeTime = this.handleChangeTime.bind(this)
  }

  handleClickAdd(event) {
    event.preventDefault()

    const { addResult, resultsList, usersList, teamsList, citiesList, raceId } = this.props
    const { userId, teamId, cityId, time } = this.state

    if(userId == null || teamId == null || cityId == null) {
      this.setState({ hasError: true })
      return
    }

    const payload = {
      user: findById(usersList, userId),
      team: findById(teamsList, teamId),
      city: findById(citiesList, cityId),
      raceId: raceId,
      time: time
    }

    addResult(payload);
    this.setState(defaultState);
  }

  handleChangeUser(value) {
    this.setState({ userId: value })
  }

  handleChangeTeam(value) {
    this.setState({ teamId: value })
  }

  handleChangeCity(value) {
    this.setState({ cityId: value })
  }

  handleChangeTime(value) {
    this.setState({ time: value })
  }

  render() {
    const { usersList, teamsList, citiesList } = this.props
    const { userId, teamId, cityId, time, hasError } = this.state

    const usersOptions = listToSelectOptions(usersList)
    const teamsOptions = listToSelectOptions(teamsList)
    const citiesOptions = listToSelectOptions(citiesList)

    const currentUserOption = userId ? usersOptions.find(item => item.value == userId) : {}
    const currentTeamOption = teamId ? teamsOptions.find(item => item.value == teamId) : {}
    const currentCityOption = cityId ? citiesOptions.find(item => item.value == cityId) : {}

    const blockClassName = hasError ? 'result result--has-error' : 'result'

    return (
      <div className={blockClassName}>
        <div className="result-id"></div>
        <EditSelect options={usersOptions} currentOption={currentUserOption} editMode onChange={this.handleChangeUser} hasError={userId == null} />
        <EditSelect options={teamsOptions} currentOption={currentTeamOption} editMode onChange={this.handleChangeTeam} hasError={teamId == null} />
        <EditSelect options={citiesOptions} currentOption={currentCityOption} editMode onChange={this.handleChangeCity} hasError={cityId == null} />
        <EditTime value={time} editMode onChange={this.handleChangeTime} />
        <div className="result-actions">
          <div><button onClick={this.handleClickAdd}>Add</button></div>
        </div>
      </div>
    )
  }
}

const mapStateToProps = ({ resultsList, usersList, teamsList, citiesList }) => ({
  resultsList,
  usersList,
  teamsList,
  citiesList
})

const mapDispatchToProps = { addResult }

export default connect(mapStateToProps, mapDispatchToProps)(AddResult)