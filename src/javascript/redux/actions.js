import { ADD_RESULT, ADD_RESULT_SUCCESS, UPDATE_RESULT, UPDATE_RESULT_SUCCESS, DELETE_RESULT, DELETE_RESULT_SUCCESS, 
TOGGLE_EDIT_MODE, FETCH_RESULTS, FETCH_USERS, FETCH_TEAMS, FETCH_CITIES, ADD_USER, FETCH_RACES, FETCH_RESULTS_SUCCESS, 
FETCH_CITIES_SUCCESS, FETCH_USERS_SUCCESS, FETCH_TEAMS_SUCCESS, FETCH_RACES_SUCCESS } from "./actionTypes"

export const fetchRaces = () => ({
  type: FETCH_RACES
})

export const fetchRacesSuccess = payload => ({
  type: FETCH_RACES_SUCCESS,
  payload: payload
})

export const fetchResults = (id) => ({
  type: FETCH_RESULTS,
  payload: { id }
})

export const fetchResultsSuccess = payload => ({
  type: FETCH_RESULTS_SUCCESS,
  payload: payload
})

export const fetchUsers = () => ({
  type: FETCH_USERS
})

export const fetchUsersSuccess = payload => ({
  type: FETCH_USERS_SUCCESS,
  payload: payload
})

export const fetchTeams = () => ({
  type: FETCH_TEAMS
})

export const fetchTeamsSuccess = payload => ({
  type: FETCH_TEAMS_SUCCESS,
  payload: payload
})

export const fetchCities = () => ({
  type: FETCH_CITIES
})

export const fetchCitiesSuccess = payload => ({
  type: FETCH_CITIES_SUCCESS,
  payload: payload
})

export const addResult = payload => ({
  type: ADD_RESULT,
  payload: payload
})

export const addResultSuccess = payload => ({
  type: ADD_RESULT_SUCCESS,
  payload: payload
})

export const addUser = payload => ({
  type: ADD_USER,
  payload: payload
})

export const updateResult = payload => ({
  type: UPDATE_RESULT,
  payload: payload
})

export const updateResultSuccess = payload => ({
  type: UPDATE_RESULT_SUCCESS,
  payload: payload
})

export const deleteResult = id => ({
  type: DELETE_RESULT,
  payload: { id }
})

export const deleteResultSuccess = id => ({
  type: DELETE_RESULT_SUCCESS,
  payload: { id }
})

export const toggleEditMode = id => ({
  type: TOGGLE_EDIT_MODE,
  payload: { id }
})
