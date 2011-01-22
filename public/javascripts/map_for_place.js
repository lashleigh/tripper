var infowindow = new google.maps.InfoWindow();
var placeMap;
var marker;

$(function() {
  // Initialize the map with default UI.
  placeMap = new google.maps.Map(document.getElementById("map_canvas_for_place"), {
    center: new google.maps.LatLng(place.latitude, place.longitude),
    zoom: 12,
    mapTypeId: 'roadmap'
  });

  marker = new google.maps.Marker({
    position: new google.maps.LatLng(place.latitude, place.longitude),
    map: placeMap,
    title: place.name,
    draggable: true,
  });

  google.maps.event.addListener(marker, 'click', function(evt) {
    infowindow.setContent(place.description);
    infowindow.open(placeMap, marker);
  });

  google.maps.event.addListener(marker, 'dragend', function(evt) {
    place.latitude = evt.latLng.lat()
    place.longitude = evt.latLng.lng()
    $.post("/places/update_location", {id: place.id, lat: place.latitude, lon: place.longitude})
  });
});

