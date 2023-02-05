const express = require('express');
const app = express();

const users = [

    { id: 1, name: 'JJ'},
    { id: 2, name: 'Dennis'},
    { id: 3, name: 'Monkey'},

];

app.get('/', (req, res) => {
    res.send('jj smells');
});


app.get('/api/users', (req, res) => {
    res.send(users);
});


app.get('/api/users/:id', (req, res) => {
   const user = users.find(c => c.id === parseInt(req.params.id));
   if (!user) res.status(404).send('The user with the given ID was not found');
   res.send(user);
});


app.get('/api/dates/:year/:month', (req, res) => {
    res.send(req.params);
});

const port = process.env.PORT || 3005;
app.listen(port, () => console.log(`Listening on port ${port}...`));