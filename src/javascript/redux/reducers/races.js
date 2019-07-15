import { FETCH_RACES_SUCCESS } from '../actionTypes'

export default function(state = [], action) {
  switch (action.type) {
    case FETCH_RACES_SUCCESS: {
      return [...action.payload]
    }
    default:
      return state;
  }
}
