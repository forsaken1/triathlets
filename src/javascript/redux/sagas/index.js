import { put, call, takeEvery } from 'redux-saga/effects'
import { FETCH_RESULTS, FETCH_USERS, FETCH_TEAMS, FETCH_CITIES, FETCH_RACES, ADD_RESULT, UPDATE_RESULT, DELETE_RESULT } from '../actionTypes'
import * as Route from '../../lib/routes'
import { resultJsonToFormData } from '../../lib/func'
import { fetchResultsSuccess, fetchUsersSuccess, fetchRacesSuccess, fetchCitiesSuccess, fetchTeamsSuccess,
addResultSuccess, updateResultSuccess, deleteResultSuccess } from '../actions'

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

export function* watchAddResult() {
  yield takeEvery(ADD_RESULT, addResultSync)
}

export function* watchUpdateResult() {
  yield takeEvery(UPDATE_RESULT, updateResultSync)
}

export function* watchDeleteResult() {
  yield takeEvery(DELETE_RESULT, deleteResultSync)
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

export function* addResultSync(action) {
  const data = yield call(() => {
    return fetch(Route.resultsPath(), { method: 'POST', body: resultJsonToFormData(action.payload) })
            .then(res => res.json())
  })
  yield put(addResultSuccess({ ...action.payload, id: data.id }))
}

export function* updateResultSync(action) {
  const data = yield call(() => {
    return fetch(Route.resultPath(action.payload.id), { method: 'PUT', body: resultJsonToFormData(action.payload) })
            .then(res => res.json())
  })
  yield put(updateResultSuccess({ ...action.payload }))
}

export function* deleteResultSync(action) {
  const data = yield call(() => {
    return fetch(Route.resultPath(action.payload.id), { method: 'DELETE' })
            .then(res => res.json())
  })
  yield put(deleteResultSuccess(action.payload.id))
}
