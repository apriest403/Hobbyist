import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route, IndexRoute } from 'react-router';
import { createHistory } from 'history';
import App from './containers/app';

const routes = (
  <Router history={ createHistory() }>
    <Route path='/test' component={ App }>
    </Route>
  </Router>
);

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(routes, document.getElementById('content'));
}, false);
