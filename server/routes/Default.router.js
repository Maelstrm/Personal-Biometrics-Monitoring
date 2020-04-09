const express = require('express');
const router = express.Router();

router.get('/test', (req, res) => {
  console.log('Server Router Works');
  res.sendStatus(200);
});

module.exports = router;