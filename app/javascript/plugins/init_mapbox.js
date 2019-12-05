import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/light-v9'
    });

  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {

  const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

  // Create a HTML element for your custom marker
  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('https://res.cloudinary.com/justsav/image/upload/v1575539164/sunsetmarker_hjqd9z.svg')`;
  element.style.backgroundSize = 'contain';
  element.style.marginTop = '-25px';

  // Pass the element as an argument to the new marker
  new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(map);

  });

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 13, duration: 0 });
  };

  if (mapElement) {
    // [ ... ]
    fitMapToMarkers(map, markers);
  }

};
};

export { initMapbox };

