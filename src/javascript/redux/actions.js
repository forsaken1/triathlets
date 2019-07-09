import { ADD_RESULT, UPDATE_RESULT, DELETE_RESULT, TOGGLE_EDIT_MODE, FETCH_RESULTS, FETCH_USERS, FETCH_TEAMS, FETCH_CITIES,
ADD_USER, FETCH_RACES } from "./actionTypes";

export const fetchRaces = payload => ({
  type: FETCH_RACES,
  payload: payload
})

export const fetchResults = payload => ({
  type: FETCH_RESULTS,
  payload: payload
});

export const fetchUsers = payload => ({
  type: FETCH_USERS,
  payload: payload
});

export const fetchTeams = payload => ({
  type: FETCH_TEAMS,
  payload: payload
});

export const fetchCities = payload => ({
  type: FETCH_CITIES,
  payload: payload
});

export const addResult = payload => ({
  type: ADD_RESULT,
  payload: payload
});

export const updateResult = payload => ({
  type: UPDATE_RESULT,
  payload: payload
});

export const deleteResult = id => ({
  type: DELETE_RESULT,
  payload: { id }
});

export const toggleEditMode = id => ({
  type: TOGGLE_EDIT_MODE,
  payload: { id }
});

export const addUser = payload => ({
  type: ADD_USER,
  payload: payload
});
