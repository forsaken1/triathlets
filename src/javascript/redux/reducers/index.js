import { ADD_RESULT, TOGGLE_EDIT_MODE, FETCH_RESULTS, FETCH_USERS, FETCH_TEAMS, FETCH_CITIES } from "../actionTypes";

const initialState = {
  resultsList: [],
  usersList: [],
  teamsList: [],
  citiesList: [],
  editMode: false
};

export default function(state = initialState, action) {
  switch (action.type) {
    case FETCH_RESULTS: {
      return {
        ...state,
        resultsList: [...action.payload]
      };
    }
    case FETCH_USERS: {
      return {
        ...state,
        usersList: [...action.payload]
      };
    }
    case FETCH_TEAMS: {
      return {
        ...state,
        teamsList: [...action.payload]
      };
    }
    case FETCH_CITIES: {
      return {
        ...state,
        citiesList: [...action.payload]
      };
    }
    case ADD_RESULT: {
      return {
        ...state,
        resultsList: [...state.resultsList, action.payload]
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
