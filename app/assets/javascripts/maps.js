

// var map;
// var coords;
// function initMap() {
//   coords = $("#map").data("params");
//   alert(coords);
//   map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: -34.397, lng: 150.644},
//     zoom: 8
//   });
// }

function initMap() {
    if ($("#map").length) {
    var coords = $("#map").data("route");
    var location = $("#map").data("location")
    // alert(coords);
    // alert(location);
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 5,
      center: {lat: 24.886, lng: -70.268},
      mapTypeId: google.maps.MapTypeId.TERRAIN
    });

    // Define the LatLng coordinates for the polygon's path.
    var route_coords = [
      {lat: 25.774, lng: -80.190},
      {lat: 18.466, lng: -66.118},
      {lat: 32.321, lng: -64.757},
      {lat: 25.774, lng: -80.190}
    ];

    // Construct the polygon.
    var trail_route = new google.maps.Polygon({
      paths: route_coords,
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#FF0000',
      fillOpacity: 0.35
    });
    trail_route.setMap(map);
  }
}
