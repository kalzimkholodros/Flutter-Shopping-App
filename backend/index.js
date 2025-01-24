const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.json());

// In-memory database for demonstration
const users = [];

// Routes
app.post('/signup', (req, res) => {
  const { username, password } = req.body;

  if (users.find(user => user.username === username)) {
    return res.status(400).json({ message: 'User already exists' });
  }

  users.push({ username, password });
  res.status(201).json({ message: 'User registered successfully' });
});

app.post('/login', (req, res) => {
  const { username, password } = req.body;

  const user = users.find(user => user.username === username && user.password === password);
  if (!user) {
    return res.status(401).json({ message: 'Invalid credentials' });
  }

  res.status(200).json({ message: 'Login successful' });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
