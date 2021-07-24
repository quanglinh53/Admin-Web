const http = require('http');
var express = require('express');
var app = express();

const hostname = 'localhost';
const port = 8080;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});
server.g

app.get('/SacMauBonPhuong_war_exploded/auth/google', function (req, res) {
    res.send('hello linhgia')
  })

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});