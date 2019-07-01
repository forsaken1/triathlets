import { ADD_RESULT, TOGGLE_EDIT_MODE } from "./actionTypes";

export const addResult = content => ({
  type: ADD_RESULT,
  payload: content
});

export const toggleEditMode = () => ({
  type: TOGGLE_EDIT_MODE,
  payload: {}
});
