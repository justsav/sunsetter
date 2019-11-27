import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

var SunCalc = require('suncalc');
var times = SunCalc.getTimes(new Date(), 51.5, -0.1);
console.log(times);

initMapbox();
