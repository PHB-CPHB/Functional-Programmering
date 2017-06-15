var express = require('express');
var router = express.Router();
var counter = require('../model/counter')

/* GET home page. */
router.get('/counter', function(req, res, next) {
  res.setHeader("Access-Control-Allow-Origin", "http://localhost:8000")
  res.json({data: counter.getCounter()});
});

router.put('/counter/:number', function(req, res, next){
  res.setHeader("Access-Control-Allow-Origin", "http://localhost:8000")
  var number = req.params.number;
  counter.setCounter(number);
});

module.exports = router;
