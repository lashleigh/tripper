$(function() {
  // Initialize the map with default UI.
  console.log(place);
  var placeMap = new google.maps.Map(document.getElementById("map_canvas_for_place"), {
    center: new google.maps.LatLng(place.latitude, place.longitude),
    zoom: 7,
    mapTypeId: 'roadmap'
  });

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(place.latitude, place.longitude),
    map: placeMap,
    title: place.name,
    draggable: true,
  });
  google.maps.event.addListener(marker, 'dragend', function(evt) {
    place.latitude = evt.latLng.lat()
    place.longitude = evt.latLng.lng()
    $.post("/places/update_location", {id: place.id, lat: place.latitude, lon: place.longitude})
  });
});

