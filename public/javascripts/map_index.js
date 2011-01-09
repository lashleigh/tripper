var infoWindow = new google.maps.InfoWindow();
var placeMap;
var geocoder = new google.maps.Geocoder();
var savedLatLng;
var savedAddress;
var searchResults = [];

// Create our "tiny" marker icon
var gYellowIcon = new google.maps.MarkerImage(
  "http://labs.google.com/ridefinder/images/mm_20_yellow.png",
  new google.maps.Size(12, 20),
  new google.maps.Point(0, 0),
  new google.maps.Point(6, 20));
var gRedIcon = new google.maps.MarkerImage(
  "http://labs.google.com/ridefinder/images/mm_20_red.png",
  new google.maps.Size(12, 20),
  new google.maps.Point(0, 0),
  new google.maps.Point(6, 20));
var gSmallShadow = new google.maps.MarkerImage(
  "http://labs.google.com/ridefinder/images/mm_20_shadow.png",
  new google.maps.Size(22, 20),
  new google.maps.Point(0, 0),
  new google.maps.Point(6, 20));

$(function() {
  // Initialize the map with default UI.
  placeMap = new google.maps.Map(document.getElementById("map_canvas"), {
    center: new google.maps.LatLng(places[0].place.latitude, places[0].place.longitude),
    zoom: 7,
    mapTypeId: 'roadmap'
  });

  $(places).each(draw_places);

  $(".addPlaceFromSearch").live("click", function(e) {
    e.preventDefault();
    createSuggestionFromSearch(e);
  });

  $("#new_place").live("submit", function(event) {
      var self = $(this);
      $.post(this.action, self.serialize(), function(res, text_status) {
        if(res.errors) {
          $("#place_errors").html('<ul><li>' + res.errors.join('</li><li>') + '</li></ul>').fadeIn(500);
          $.fancybox.resize();
        }
        else {
          draw_places(0, res);
          $.fancybox.close();
          infoWindow.close();
        }
      }, "json");
      return false;
  });

});

function draw_places(i, placeObj) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(placeObj.place.latitude, placeObj.place.longitude),
    map: placeMap,
    title: placeObj.place.name,
    //draggable: true,
  });
  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.setContent(placeObj.place.description + content);
    infoWindow.open(placeMap, marker);
  });
}

function drawResults(i, result) {
  var marker = new google.maps.Marker({
      map: placeMap, 
      position: result.geometry.location,
      icon: gYellowIcon, 
      shadow: gSmallShadow,
  });
  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.setContent(result.formatted_address + "</br>" + savedLatLng + "</br>" + 
      '<input class="addPlaceFromSearch" type="button" value="Save this place?">'
      );
    infoWindow.open(placeMap, marker);
  });
}

function codeAddress() {
  var address = document.getElementById("address").value;
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      $(results).each(drawResults);
      console.log(results);
      savedAddress = results[0].formatted_address;
      savedLatLng = results[0].geometry.location;
      placeMap.setCenter(savedLatLng);

    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });
}

function createSuggestionFromSearch(event) {
  $.get("/home/new_place",
             { lat: savedLatLng.lat(),
               lng: savedLatLng.lng(),
               name: savedAddress, },
             function(stuff) {
               $.fancybox({ content: stuff, scrolling: "no" });
             });
}

