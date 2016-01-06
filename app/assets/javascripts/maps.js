//
// Used to draw the google map based on:
//  - Route of the trail: Trail#Route
//  Which is stored in data-route value in the view:
//  - ./app/views/trails/show.html.erb
//
function initMap() {
  if ($("#map").length) {
    var route = $("#map").data("route");
    var center = route[route.length / 2];
    var trail_head = route[0];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: center,
      mapTypeId: google.maps.MapTypeId.HYBRID
    });

    var marker = new google.maps.Marker({
      position: trail_head,
      map: map,
      title: 'Trail Head'
    });

    var trail_route = new google.maps.Polygon({
      paths: route,
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2
    });
    trail_route.setMap(map);
  }
}
