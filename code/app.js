const http = require('http');
const mysql = require('mysql');

const hostname = '0.0.0.0';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "pharmac0n"
  });
  
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });