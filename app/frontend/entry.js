import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  constructor (props) {
    super(props);
  }
  render () {
    return (
      <div className='container'>
        <h1>Hello, world!</h1>
      </div>
    );
  }
};

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<App />, document.getElementById('content'));
}, false);
