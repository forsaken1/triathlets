import { combineReducers } from 'redux'
import results from './results'
import users from './users'
import teams from './teams'
import cities from './cities'
import races from './races'
import editable from './editable'

export default combineReducers({ resultsList: results, usersList: users, teamsList: teams, citiesList: cities, racesList: races, editableId: editable })
