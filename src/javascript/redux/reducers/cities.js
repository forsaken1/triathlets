import { FETCH_CITIES_SUCCESS } from '../actionTypes'

export default function(state = [], action) {
  switch (action.type) {
    case FETCH_CITIES_SUCCESS: {
      return [...action.payload]
    }
    default:
      return state;
  }
}
