import "bootstrap";

var SunCalc = require('suncalc');
var times = SunCalc.getTimes(new Date(), 51.5, -0.1);
console.log(times);
