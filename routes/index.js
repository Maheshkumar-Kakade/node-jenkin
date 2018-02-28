var express = require('express');
var fs = require('fs')
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  var data = fs.readFileSync(__dirname +  '/../package.json')
  var packageInfo = JSON.parse(data);
  res.render('index', { title: 'ExpressJS' ,version : packageInfo.version });
});

module.exports = router;
