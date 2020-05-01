const express = require('express');
const router = express.Router();

var pgp = require('pg-promise')(/* options */)

const pgConfig = {
  host: 'localhost',
  port: 5432,
  database: 'PBMon',
  user: 'jakehclark',
  max: 30
};

var db = pgp(pgConfig)

router.post('/addSession', (req, res) => {
  db.one(`
    INSERT INTO "Sessions" (user_id)
      VALUES($1)
      RETURNING session_id`,
    [1])
  .then(data => {
    console.log(data.session_id)
    res.status(200).send(`${data.session_id}`)
  })
  .catch(function (error) {
    console.log('ERROR:', error)
    res.sendStatus(400);
  })
});

module.exports = router;