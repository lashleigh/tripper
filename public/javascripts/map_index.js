var infoWindow = new google.maps.InfoWindow();
var placeMap;
var marker;

$(function() {
  // Initialize the map with default UI.
  placeMap = new google.maps.Map(document.getElementById("map_canvas"), {
    center: new google.maps.LatLng(places[0].place.latitude, places[0].place.longitude),
    zoom: 7,
    mapTypeId: 'roadmap'
  });

  $(places).each(draw_places);

});

function draw_places(i, place) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(place.place.latitude, place.place.longitude),
    map: placeMap,
    title: place.place.name,
    //draggable: true,
  });
  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.setContent(place.place.description);
    infoWindow.open(placeMap, marker);
  });
}

