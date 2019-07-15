import { ADD_RESULT, UPDATE_RESULT, DELETE_RESULT, FETCH_RESULTS_SUCCESS } from "../actionTypes";

export default function(state = [], action) {
  switch (action.type) {
    case FETCH_RESULTS_SUCCESS: {
      return [...action.payload]
    }
    case ADD_RESULT: {
      return [...state, action.payload]
    }
    case UPDATE_RESULT: {
      const index = state.findIndex(i => i == action.payload.id)

      if(index) {
        state[index] = action.payload
        return [...state]
      } else {
        return state;
      }
    }
    case DELETE_RESULT: {
      return [...state.filter(item => item.id != action.payload.id)]
    }
    default:
      return state;
  }
}