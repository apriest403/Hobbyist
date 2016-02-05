import React from 'react';

class Login extends React.Component {
  constructor (props) {
    super(props);
    this.email = '';
    this.password = '';
  }
  handleEmail (e) {
    e.preventDefault();
    this.email = e.target.value;
  }
  handlePassword (e) {
    e.preventDefault();
    this.password = e.target.value;
  }
  render () {
    return (
      <div className='col-md-6 col-md-offset-3'>
        <h2>Login</h2>
        <form>
          <label>Email</label><br/>
          <input className='form-control' type='text' 
                 onChange={this.handleEmail} value={this.email}/>
          <br/><br/>
          <label>Password</label><br/>
          <input className='form-control' type='password' 
                 onChange={this.handlePassword} value={this.password}/>
          <br/><br/>
          <input type='Submit' value='Login' className='btn btn-default' />
        </form>
      </div>
    );
  }
};

export default Login;