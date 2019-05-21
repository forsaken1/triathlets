const path = require("path");

module.exports = {
  entry: "./src/javascripts/index.js",
  output: {
    path: path.join(__dirname, "public/javascripts"),
    filename: "bundle.js"
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        },
      },
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"]
      }
    ]
  }
};
