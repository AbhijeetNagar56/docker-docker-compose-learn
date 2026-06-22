import express from 'express';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import cors from 'cors';
import fs from 'fs';

dotenv.config();

let dbUrl;

// If a secret file is provided, build the DB URL dynamically
if (process.env.DB_PASSWORD_FILE) {
  const password = fs.readFileSync(process.env.DB_PASSWORD_FILE, 'utf8').trim();
  dbUrl = `mysql://${process.env.DB_USER}:${password}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_NAME}`;
} else {
  // fallback: use DB env directly (for local dev)
  dbUrl = process.env.DB;
}

const pool = mysql.createPool(dbUrl);

const app = express();
const port = 4321;

// Middleware
app.use(express.json());
app.use(cors({ origin: "*" }));

// Healthcheck
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok' });
});

// DB test
app.get('/api/dbtest', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT NOW()');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Get user data
app.get('/api/data', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM user WHERE id=?', [1]);
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Edit user
app.post('/api/edit', async (req, res) => {
  const { id, name, bio, github, leetcode, friend } = req.body;
  try {
    await pool.query(
      'UPDATE user SET name=?, bio=?, github=?, leetcode=?, friend=? WHERE id=?',
      [name, bio, github, leetcode, friend, id]
    );
    res.json({ message: 'User updated successfully' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
