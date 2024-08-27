import { createStore, combineReducers } from 'redux';
import booksReducer from './reducers/booksReducer';
import userReducer from './reducers/userReducer';

const rootReducer = combineReducers({
  books: booksReducer,
  user: userReducer,
});

const store = createStore(rootReducer);

export default store;
