import React  from 'react';
import Navbar from '../components/navbar';
import Dashboard from '../components/dashboard';
import Login from '../components/login';

class App extends React.Component {
  constructor (props) {
    super(props);
  }
  render () {
    return (
      <div>
        <Navbar />
        { this.props.children }
      </div>
    );
  }
};

export default App;
