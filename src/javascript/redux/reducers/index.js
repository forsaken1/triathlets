import { ADD_RESULT, TOGGLE_EDIT_MODE } from "../actionTypes";

const initialState = {
  results: [],
  editMode: false
};

export default function(state = initialState, action) {
  switch (action.type) {
    case ADD_RESULT: {
      const { id, user_id, city_id, team_id, time } = action.payload;
      return {
        ...state,
        results: [...state.results, { id, user_id, city_id, team_id, time }]
      };
    }
    case TOGGLE_EDIT_MODE: {
      return {
        ...state,
        editMode: !state.editMode
      };
    }
    default:
      return state;
  }
}
