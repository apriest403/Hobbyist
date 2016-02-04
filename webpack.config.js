const path = require('path');
const webpack = require('webpack');

module.exports = {
  context: __dirname,
  entry: './app/frontend/entry.js',
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    filename: 'bundle.js'
  },
  // plugins: [
  //   new webpack.optimize.UglifyJsPlugin({minimize: true})
  // ],
  devtool: 'source-maps',
  resolve: {
    extensions: ['', '.js', '.jsx']
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel',
        query: {
          presets: ['react', 'es2015']
        }
      },
      {
        test: /\.node$/,
        loader: 'node-loader'
      }
    ]
  }
};
