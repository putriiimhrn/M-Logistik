// app.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const db = require('./db'); // Import your MySQL connection

const app = express();
app.use(cors());
app.use(bodyParser.json());

// API endpoint to retrieve first_name and last_name from the admin table
app.get('/api/user-names', (req, res) => {
  db.query('SELECT User_ID, email, password FROM user', (err, rows) => {
    if (err) {
      console.error('Error querying admin table:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.json(rows);
  });
});

app.get('/api/surat-pengajuan', (req, res) => {
  db.query('SELECT Surat_ID, tanggal, topik, status FROM surat_pengajuan', (err, rows) => {
    if (err) {
      console.error('Error querying admin table:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.json(rows);
  });
});

app.get('/api/laporan-rutin', (req, res) => {
  db.query('SELECT tanggal, topik, isi FROM laporan_rutin', (err, rows) => {
    if (err) {
      console.error('Error querying admin table:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.json(rows);
  });
});

app.get('/api/barang', (req, res) => {
  db.query('SELECT nama, jumlah, harga FROM barang', (err, rows) => {
    if (err) {
      console.error('Error querying admin table:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.json(rows);
  });
});

app.post('/api/barang', (req, res) => {
  const { nama, jumlah, harga } = req.body;

  if (!nama || !jumlah || !harga) {
    res.status(400).json({ error: 'Invalid data. Please provide nama, jumlah, and harga.' });
    return;
  }

  const query = 'INSERT INTO barang (nama, jumlah, harga) VALUES (?, ?, ?)';
  const values = [nama, jumlah, harga];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Error inserting data into barang table:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.json({ message: 'Data inserted successfully' });
  });
});

app.post('/api/surat-pengajuan', (req, res) => {
  const { User_ID, tanggal, topik } = req.body;

  if (!User_ID || !tanggal || !topik) {
    res.status(400).json({ error: 'Invalid data. Please provide id, tanggal, and topik.' });
    return;
  }

  const query = 'INSERT INTO surat_pengajuan (User_ID, tanggal, topik, status) VALUES (?, ?, ?, "Menunggu")';
  const values = [User_ID, tanggal, topik];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Error inserting data into barang table:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.json({ message: 'Data inserted successfully' });
  });
});

app.post('/api/post-laporan-rutin', (req, res) => {
  const { User_ID, tanggal, topik, isi } = req.body;

  if (!User_ID || !tanggal || !topik || !isi) {
    res.status(400).json({ error: 'Invalid data. Please provide id, tanggal, topik, and isi.' });
    return;
  }

  const query = 'INSERT INTO laporan_rutin (User_ID, tanggal, topik, isi) VALUES (?, ?, ?, ?)';
  const values = [User_ID, tanggal, topik, isi];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Error inserting data into barang table:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.json({ message: 'Data inserted successfully' });
  });
});

app.put('/api/update-surat', (req, res) => {
  const { Surat_ID, status } = req.body;

  if (!Surat_ID || !status) {
    res.status(400).json({ error: 'Invalid data. Please provide status.' });
    return;
  }

  const query = 'UPDATE surat_pengajuan SET status = ? WHERE Surat_ID = ?';
  const values = [status, Surat_ID];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Error updating data in surat_pengajuan table:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.json({ message: 'Data updated successfully' });
  });
});


// Your other endpoints and server setup here...

const port = process.env.PORT || 3000;
app.listen(port, '192.168.1.10', () => {
  console.log(`Server is running on port ${port}`);
});


// const port = process.env.PORT || 3000;
// app.listen(port, () => {
//   console.log(`Server is running on port ${port}`);
// });
