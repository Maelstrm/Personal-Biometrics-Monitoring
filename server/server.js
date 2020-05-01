const express = require('express');

const app = express();
const bodyParser = require('body-parser');


const defaultRoute = require('./routes/Default.router');


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use('/api/default', defaultRoute);


app.use(express.static('build'));


const PORT = process.env.PORT || 5000;


app.listen(PORT, () => {
  console.log(`Listening on port: ${PORT}`);
});