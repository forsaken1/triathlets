import { ADD_RESULT, TOGGLE_EDIT_MODE, FETCH_RESULTS, FETCH_USERS, FETCH_TEAMS, FETCH_CITIES } from "./actionTypes";
import * as Route from '../lib/routes.js';

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

export const toggleEditMode = () => ({
  type: TOGGLE_EDIT_MODE,
  payload: {}
});
