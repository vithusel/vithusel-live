// Initialize and add the map
function initMap() {
  // The location of Uluru
  var croydon = {lat: 51.3762, lng: -0.098234};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 13, center: croydon});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: croydon, map: map});
}