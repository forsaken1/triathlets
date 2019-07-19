import { FETCH_TEAMS_SUCCESS } from '../actionTypes'

export default function(state = [], action) {
  switch (action.type) {
    case FETCH_TEAMS_SUCCESS: {
      return [...action.payload]
    }
    default:
      return state;
  }
}
