import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initUpdateNavbarOnScroll } from "../plugins/navbar";
import Swal from 'sweetalert2';
import { initAlert } from '../plugins/alert.js'

var SunCalc = require('suncalc');
var times = SunCalc.getTimes(new Date(), 38.7223, -9.1393);
console.log(times);

initMapbox();
initUpdateNavbarOnScroll();
initAlert();

