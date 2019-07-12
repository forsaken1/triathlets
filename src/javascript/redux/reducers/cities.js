import { FETCH_CITIES } from '../actionTypes'

export default function(state = [], action) {
  switch (action.type) {
    case FETCH_CITIES: {
      return [...action.payload]
    }
    default:
      return state;
  }
}
