import { ADD_RESULT, UPDATE_RESULT, DELETE_RESULT, TOGGLE_EDIT_MODE, FETCH_RESULTS, FETCH_USERS, FETCH_TEAMS, FETCH_CITIES } from "../actionTypes";

const initialState = {
  resultsList: [],
  usersList: [],
  teamsList: [],
  citiesList: [],
  editableId: null
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
    case UPDATE_RESULT: {
      const index = state.resultsList.findIndex(i => i == action.payload.id)

      if(index) {
        state.resultsList[index] = action.payload
        return {
          ...state,
          resultsList: [...state.resultsList]
        };
      } else {
        return state;
      }
    }
    case DELETE_RESULT: {
      return {
        ...state,
        resultsList: [...state.resultsList.filter(item => item.id != action.payload.id)]
      }
    }
    case TOGGLE_EDIT_MODE: {
      return {
        ...state,
        editableId: state.editableId == action.payload.id ? null : action.payload.id
      };
    }
    default:
      return state;
  }
}
