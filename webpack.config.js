var path = require('path');
var webpack = require('webpack');

module.exports = {
  devtool: 'eval',
  entry: [
    'react-hot-loader/patch',
    'webpack-dev-server/client?http://localhost:3000',
    'webpack/hot/only-dev-server',
    './bin/js/main'
  ],
  output: {
    path: path.join(__dirname, 'public/bin'),
    filename: 'bundle.js',
    publicPath: '/bin/'
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ],
  module: {
    loaders: [{
      test: /\.js$/,
      loaders: ['react-hot-loader/webpack'],
      include: path.join(__dirname, 'src/js')
    }]
  }
};
