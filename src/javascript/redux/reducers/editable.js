import { TOGGLE_EDIT_MODE } from '../actionTypes'

export default function(state = null, action) {
  switch (action.type) {
    case TOGGLE_EDIT_MODE: {
      return state == action.payload.id ? null : action.payload.id
    }
    default:
      return state;
  }
}
