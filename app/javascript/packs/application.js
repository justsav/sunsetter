import "bootstrap";

var SunCalc = require('suncalc');
var times = SunCalc.getTimes(new Date(), 38.7223, -9.1393);
console.log(times);
