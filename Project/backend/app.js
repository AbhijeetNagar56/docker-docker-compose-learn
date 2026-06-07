import express from 'express';
import pg from 'pg';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import cors from 'cors';
import path from 'path';

dotenv.config();
const pool = mysql.createPool(process.env.DB);

const app = express();
const port = 4321;

const __dirname = path.dirname(new URL(import.meta.url).pathname);


// Middleware to parse JSON bodies
app.use(express.json());
app.use(cors({
    origin: "*" // allow from any origin, you can specify your frontend URL here
}));


app.get('/api/dbtest', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/api/data', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM user where id=?', [1]);
    res.json(result[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.post('/api/edit', async (req, res) => {
  const { id, name, bio, github, leetcode, friend } = req.body;
  try {
    await pool.query('UPDATE user SET name = ?, bio = ?, github = ?, leetcode = ?, friend = ? WHERE id = ?', [name, bio, github, leetcode, friend, id]);
    res.json({ message: 'User updated successfully' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});


app.get('/', (req, res) => {
  // res.send('Hello from the backend!');  
  res.sendFile(path.join(__dirname, '../frontend/dist/index.html'));
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});