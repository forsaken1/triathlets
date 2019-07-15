import { FETCH_USERS_SUCCESS, ADD_USER } from '../actionTypes'

export default function(state = [], action) {
  switch (action.type) {
    case FETCH_USERS_SUCCESS: {
      return [...action.payload]
    }
    case ADD_USER: {
      return [...state, action.payload]
    }
    default:
      return state;
  }
}
