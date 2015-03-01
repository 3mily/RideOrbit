$(function(){
  var map;
  var directionsService = new google.maps.DirectionsService();
  var directionsDisplay = new google.maps.DirectionsRenderer();
  var driverOrigins = []; 
  var driverDestinations = [];
  var passengerOrigins = [];
  var passengerDestinations = [];
  var bounds; //grab bounds for map
  var iconImg; //url for custom icon
  var userInfo; //response objects returned from polling our db
  var currentlyBouncing = null; //bounce animation tracker default to null
  var contentString;
  var commute;
  var origin;
  var destination;
  var waypoints = [];
  var allOverlays = [];
  var allMarkers = [];
  var commuteId;
  var searchRadius = 1000;

  google.maps.event.addDomListener(window, 'load', initialize);

  $("#commutes-select-toggle").on("click", function(){
    $("#passenger-commute-select").toggle();
    $("#driver-commute-select").toggle();
  });

  $("#commute_driver").on("change", function(){
    calcInitRoute("driver");
  });

  $("#commute_passenger").on("change", function(){
    calcInitRoute("passenger");
  });

  $('#search_radius').on('keyup', function(){
    searchRadius = $('#search_radius').val()*1000;
    calcInitRoute(commuter)
  });

  function initialize() {
    initMap();
    initDirections();
    getDriverCommutes();
    getPassengerCommutes();
  }

  function initMap() {
    var mapOptions = {
      center: { lat: 49.282043, lng: -123.108162},
      zoom: 11
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    $(document.body).on("click", ".redraw", function(e){
          var lat = this.getAttribute("data-lat");
          var lng = this.getAttribute("data-lng");
          var waypt = new google.maps.LatLng(lat, lng);
          console.log(waypt);
          waypoints.push({
          location:waypt,
            stopover:true
          });
          console.log(waypoints);
          renderRoute();
        });
  }

  function initDirections(){
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('directions-panel'));
  }

  function getDriverCommutes(){
    var commutes = $("#map-canvas").data("drivercommutes");
    $.each(commutes, function(index, commute){
      driverOrigins.push(commute.origin);
      driverDestinations.push(commute.destination);
    });
  }

  function getPassengerCommutes(){
    var commutes = $("#map-canvas").data("passengercommutes");
    $.each(commutes, function(index, commute){
      passengerOrigins.push(commute.origin);
      passengerDestinations.push(commute.destination);
    });
  }

  function calcInitRoute(user) {
    removeCircles();
    removeMarkers();
    getCoordinates(user);
    renderRoute();
    addCircles(origin);
    addCircles(destination);
    showAllMarkers(user);
  }

  function removeCircles(){
    if (origin) {
      for (var i=0; i < allOverlays.length; i++)
      {
        allOverlays[i].setMap(null);
      }
      allOverlays = [];
    }
  }

  function removeMarkers(){
    if (origin) {
      for (var i=0; i < allMarkers.length; i++)
      {
        allMarkers[i].setMap(null);
      }
      allMarkers = [];
    }
  }

  function getCoordinates(user) {
    if (user==="passenger") {
      var commuteInfo = document.getElementById('commute_passenger').value;
      getCommuteInfo(commuteInfo);
      origin = new google.maps.LatLng(passengerOrigins[commute][0], passengerOrigins[commute][1]); 
      destination = new google.maps.LatLng(passengerDestinations[commute][0], passengerDestinations[commute][1]); 
    } else if (user === "driver"){
      var commuteInfo = document.getElementById('commute_driver').value;     
      getCommuteInfo(commuteInfo);
      origin = new google.maps.LatLng(driverOrigins[commute][0], driverOrigins[commute][1]); 
      destination = new google.maps.LatLng(driverDestinations[commute][0], driverDestinations[commute][1]); 
    }
  }

  function getCommuteInfo(commute_info){
    var commuteInfo = commute_info
    var commuteInfoArray = commuteInfo.split(',');
    commute = commuteInfoArray[0];
    commuteId = commuteInfoArray[1];
    commuter = commuteInfoArray[2];
  }

  function renderRoute(){
    var request = {
        origin:origin,
        destination:destination,
        waypoints: waypoints,
        optimizeWaypoints: true,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }
    });
  }

  function addCircles(place){
    var searchOptions = {
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 0,
      fillColor: '#F15A24',
      fillOpacity: 0.2,
      map: map,
      center: place,
      radius: searchRadius
    };
    circles = new google.maps.Circle(searchOptions);
    allOverlays.push(circles);
  }

  function showAllMarkers(user){
    var commuteHash = {
      "commute_id": commuteId,
      "commuter": user,
      "search_radius": searchRadius,
      "DEGREE": 111209.70146739246
    };
    $.ajax({
      url: '/api/passengercommutes',
      method: 'get',
      dataType: 'json',
      data: commuteHash,
      success: function(response) {
          userInfo = response;
          initCommutes();
          console.log(response);
      },
    });
  }

  function initCommutes() {
    for (var i = 0, len = userInfo.length; i < len; i++) {
      addCommute(i);
    }
  }

  function addCommute(idx) {
    addCommuteMarker(idx, 'origin');
    addCommuteMarker(idx, 'destination');
  } 

  function addCommuteMarker(idx, place) {
    selectIconImg(place);
    commuteCoordinates = userInfo[idx][place]
    createMarker();
    createInfoWindow(idx,place);
    addBounceToMarker(idx,place);
  }

  function selectIconImg(place) {
    if (place === 'origin'){
      iconImg = 'http://ecir.mit.edu/templates/rt_clarion/images/icons/icon-person.png'
    }
    else{
      iconImg = 'http://www.wholeperson-counseling.org/gif/point-l.gif'
    }
  }

  function createMarker(){
    commuteCoordinates.marker = new google.maps.Marker({
      position: new google.maps.LatLng(commuteCoordinates[0], commuteCoordinates[1]),
      icon: iconImg,
      map: map
    });
    allMarkers.push(commuteCoordinates.marker)
  }

  function addBounceToMarker(idx,place) {
    google.maps.event.addListener(commuteCoordinates.marker, 'click', function () {
      if (currentlyBouncing) {
        currentlyBouncing.origin.marker.setAnimation(null);
        currentlyBouncing.destination.marker.setAnimation(null);
      }
      currentlyBouncing = userInfo[idx];
      currentlyBouncing.origin.marker.setAnimation(google.maps.Animation.BOUNCE);
      currentlyBouncing.destination.marker.setAnimation(google.maps.Animation.BOUNCE);
    });
  }

  function createInfoWindow(idx,place) {
    var clickedCommuteInfo = userInfo[idx]['user_info'];
    var coordinates = userInfo[idx][place];
    contentString = '<div>'+'Name: ' + clickedCommuteInfo['name'] +'<br>'+
                    'Email: ' + clickedCommuteInfo['email'] +'<br>'+
                    'Phone: ' + clickedCommuteInfo['name'] +'<br>'+
                    '<a href="#">View Profile</a>'+'<br>'+
                    '<button class="redraw" data-lat="' + userInfo[idx][place][0] + '" data-lng="' + userInfo[idx][place][1] +'">Redraw Route</button>' +
                    '<button class="request-button">Connect</button>'
                    '</div>';
    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });
    currentCommuteIndex = idx;
    google.maps.event.addListener(coordinates.marker, 'click', function() {
      infowindow.open(map,coordinates.marker);
      resetRequestButton();
    });
  }

  function resetRequestButton(){
    if (commuter==="driver"){
      $('.request-button').text("Invite to Ride");
    } else {
      $('.request-button').text("Request a Ride");
    }
    $('.request-button').attr("disabled", false);
  }

  $("#map-canvas").on("click", ".request-button", function(){
    alert("click worked");
    var params = {
      "initiator": initiator,
      "user": commuter,
      "user_commute_id": commuteId,
      "requested_commute_id": userInfo[currentCommuteIndex]['id']
    };
    $.ajax({
      url: "/requests",
      type: "POST",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("it didnt save or work or something oh noes", thrownError);
      },
      success: function(response){
        console.log(response);
        $('.request-button').attr("disabled", true);
        $('.request-button').text("Sent Request");
      }
    });
  });

});
