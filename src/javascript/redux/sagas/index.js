import { put, call, takeEvery } from 'redux-saga/effects'
import { FETCH_RESULTS, FETCH_USERS, FETCH_TEAMS, FETCH_CITIES, FETCH_RACES } from '../actionTypes'
import * as Route from '../../lib/routes'
import { fetchResultsSuccess, fetchUsersSuccess, fetchRacesSuccess, fetchCitiesSuccess, fetchTeamsSuccess } from '../actions'

export function* watchFetchResults() {
  yield takeEvery(FETCH_RESULTS, fetchResultsAsync)
}

export function* watchFetchUsers() {
  yield takeEvery(FETCH_USERS, fetchUsersAsync)
}

export function* watchFetchTeams() {
  yield takeEvery(FETCH_TEAMS, fetchTeamsAsync)
}

export function* watchFetchCities() {
  yield takeEvery(FETCH_CITIES, fetchCitiesAsync)
}

export function* watchFetchRaces() {
  yield takeEvery(FETCH_RACES, fetchRacesAsync)
}

export function* fetchResultsAsync(action) {
  const data = yield call(() => {
    return fetch(Route.resultsPath(action.payload.id))
            .then(res => res.json())
  })
  yield put(fetchResultsSuccess(data))
}

export function* fetchUsersAsync() {
  const data = yield call(() => {
    return fetch(Route.usersPath())
            .then(res => res.json())
  })
  yield put(fetchUsersSuccess(data))
}

export function* fetchTeamsAsync() {
  const data = yield call(() => {
    return fetch(Route.teamsPath())
            .then(res => res.json())
  })
  yield put(fetchTeamsSuccess(data))
}

export function* fetchCitiesAsync() {
  const data = yield call(() => {
    return fetch(Route.citiesPath())
            .then(res => res.json())
  })
  yield put(fetchCitiesSuccess(data))
}

export function* fetchRacesAsync() {
  const data = yield call(() => {
    return fetch(Route.racesPath())
            .then(res => res.json())
  })
  yield put(fetchRacesSuccess(data))
}
