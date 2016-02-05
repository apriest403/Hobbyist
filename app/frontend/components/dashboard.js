import React from 'react';

class Dashboard extends React.Component {
  constructor (props) {
    super(props);
  }
  render () {
    return (
      <div>
        <video autoPlay className='index-video' 
          loop id='index' poster='/assets/placeholder.png'>
          <source 
            src='http://zippy.gfycat.com/JampackedClearcutArrowana.webm' 
            type='video/webm' />
          Shit don't work
        </video>

        <div id='index'>
          <h1>Hobbyist</h1>
          <h3>Try new things</h3>
          <h3>Meet cool people</h3>
          <a href='/#/login' className='btn btn-default'>
            Enter
          </a>
        </div>
      </div>
    );
  }
};

export default Dashboard;