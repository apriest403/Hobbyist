import React from 'react';
import Link from 'react-router';

class Navbar extends React.Component {
  constructor (props) {
    super(props);
  }
  render () {
    return (
      <div className='navbar navbar-default' role='navigation'>
        <div className='container'>
          <div className='navbar-header'>
            <button type='button' className='navbar-toggle' 
                    data-toggle='collapse' 
                    data-target='#bs-example-navbar-collapse-1'>
                <span className='sr-only'>Hobbyist</span>
                <span className='icon-bar'></span>
                <span className='icon-bar'></span>
                <span className='icon-bar'></span>
            </button>
            <a href='/' className='navbar-brand'>Hobbyist</a>
          </div>
          <div className='collapse navbar-collapse' 
               id='bs-example-navbar-collapse-1'>
            <ul className='nav navbar-nav pull-right'>
              <li><a href='/test/#/'>Home</a></li>
              <li><a href='/test/#/'>Explore</a></li>
              <li><a href='/test/#/'>About</a></li>
            </ul>
          </div>
        </div>
      </div>
    );
  }
};

export default Navbar;
