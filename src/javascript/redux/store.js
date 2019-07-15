import { createStore, applyMiddleware } from "redux"
import rootReducer from "./reducers"
import createSagaMiddleware from 'redux-saga'
import { watchFetchResults, watchFetchRaces, watchFetchUsers, watchFetchCities, watchFetchTeams } from './sagas'

const sagaMiddleware = createSagaMiddleware()

export default createStore(rootReducer, applyMiddleware(sagaMiddleware))

sagaMiddleware.run(watchFetchResults)
sagaMiddleware.run(watchFetchRaces)
sagaMiddleware.run(watchFetchUsers)
sagaMiddleware.run(watchFetchCities)
sagaMiddleware.run(watchFetchTeams)
