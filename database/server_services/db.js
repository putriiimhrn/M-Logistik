// db.js
const mysql = require('mysql');

const connection = mysql.createConnection({
  host: '192.168.1.10',
  user: 'root',
  password: 'toor',
  database: 'mlogistik',
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

module.exports = connection;
