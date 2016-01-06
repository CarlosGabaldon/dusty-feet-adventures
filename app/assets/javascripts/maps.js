//
// Used to draw the google map based on:
//  - Location of the trail: Trail#location.lat_long_coords
//  - Route of the trail: Trail#Route
//  The above values are stored in data param values in the view:
//  - ./app/views/trails/show.html.erb
//
function initMap() {
  if ($("#map").length) {
    var route = $("#map").data("route");
    var location = $("#map").data("location");
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 17,
      center: location,
      mapTypeId: google.maps.MapTypeId.HYBRID
    });

    var marker = new google.maps.Marker({
      position: location,
      map: map,
      title: 'Trail Head'
    });

    // Construct the polygon.
    var trail_route = new google.maps.Polygon({
      paths: route,
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2
    });
    trail_route.setMap(map);
  }
}
