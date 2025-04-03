const express = require('express');
const { User, printName, printAge } = require('./user');

const app = express();
const port = 8080;

const user = new User('Paula Andrezza Gomes Marinho', 25);

app.get('/user_data', (req, res) => {
  res.send(`User's name is ${user.name} and User's age is ${user.age}`);
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
