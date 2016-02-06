import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route, IndexRoute } from 'react-router';
import { createHistory } from 'history';
import App from './containers/app';
import Dashboard from './components/dashboard';
import Login from './components/login';

const routes = (
  <Router history={ createHistory() }>
    <Route path='/test' component={ App }>
      <IndexRoute component={ Dashboard } />
    </Route>
  </Router>
);

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(routes, document.getElementById('content'));
}, false);
