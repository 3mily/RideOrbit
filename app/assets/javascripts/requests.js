$(function(){

  $("#commutes-select-toggle").on("click", function(){
    $("#requests-as-passenger").toggle();
    $("#requests-as-driver").toggle();
  });

  $(".accept").on("click", function(){
    var clicked = $(this).parent();
    getInfo(clicked);
    updateRequest();
    updateDriverCommute();
    updatePassengerCommute();
    // sendAcceptText();
  });

  $(".decline").on("click",function(){
    var clicked = $(this).parent();
    decline(clicked);
  });

  $(".disconnect").on("click",function(){
    var clicked = $(this).parent();
    decline(clicked);
  })

  $(".show-route").text("Show Route");

  $(".show-route").on("click",function(){
    var clickedButton = $(this)
    var insideText = clickedButton.text()
    if (insideText == "Show Route"){
      $("#map-canvas2").removeClass("hidden");
      $("#directions-panel2").removeClass("hidden");
      initialize(clickedButton);
      clickedButton.text("Hide Route")
    } else if (insideText == "Hide Route"){
      $("#map-canvas2").addClass("hidden");
      $("#directions-panel2").addClass("hidden");
      clickedButton.text("Show Route")
    }
  })

  function getInfo(clicked){
    params = clicked.data("request");
    params["status"] = "accept";
  }

  function updateRequest(){
    $.ajax({
      url: "/requests/"+params["id"],
      type: "PATCH",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("it didnt save or work or something oh noes", thrownError);
      },
      success: function(response){
        console.log("success requestupdate")
      }
    });
  }

  function updateDriverCommute(){
    $.ajax({
      url: "/drivercommutes/"+params["drivercommute_id"],
      type: "PATCH",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("it didnt save or work or something oh noes", thrownError);
      },
      success: function(response){
        console.log("success drivercommuteupdate")
      }
    });
  }

  function updatePassengerCommute(){
    $.ajax({
      url: "/passengercommutes/"+params["passengercommute_id"],
      type: "PATCH",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("it didnt save or work or something oh noes", thrownError);
      },
      success: function(response){
        console.log("success passengerupdate")
      }
    });    
  }

  function sendAcceptText(){
    $.ajax({
      url: "/twilio",
      type: "POST",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("it didnt save or work or something oh noes", thrownError);
      },
      success: function(response){
        console.log("success - twilio text send")
      }
    });
  }

  function decline(clicked){
    getInfo(clicked);
    params["status"]="decline";
    declineRequest();    
  }

  function declineRequest(){
    $.ajax({
      url: "/requests/"+params["id"],
      type: "PATCH",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("didn't decline", thrownError)
      },
      success: function(response){
        console.log("decline success")
        console.log(response)
      }
    });
  }

 //maps logic below

  function initialize(clicked_button) {
    initMap();
    initDirections();
    getDriverCommute(clicked_button);
    getPassengerCommute(clicked_button);
  } 

  function initMap() {
    var mapOptions = {
      center: { lat: 49.282043, lng: -123.108162},
      zoom: 11
    };
    map = new google.maps.Map(document.getElementById('map-canvas2'), mapOptions);
  }

  function initDirections(){
    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('directions-panel2'));
  }

  function getDriverCommute(clicked_button){
    var requestInfo = clicked_button.parent(".d-request").data("request");
    $.ajax({
      url: '/drivercommutes/requestinfo',
      method: "GET",
      dataType: "json",
      data: requestInfo,
      error: function(xhr,status,thrownError){
        console.log("failed to get driver commute lat longs")
      },
      success: function(response){
        console.log(response);
        var driverInfo = response;
        getDriverCoordinates(driverInfo);
      }
    }); 
  }

  function getDriverCoordinates(driverInfo){
    var driver_origin = driverInfo["origin"];
    origin = new google.maps.LatLng(driver_origin[0], driver_origin[1]);
    var driver_destination = driverInfo["destination"];
    destination = new google.maps.LatLng(driver_destination[0],driver_destination[1]);
  }

  function getPassengerCommute(clicked_button){
    var requestInfo = clicked_button.parent(".d-request").data("request");
    $.ajax({
      url: '/passengercommutes/requestinfo',
      method: "GET",
      dataType: "json",
      data: requestInfo,
      error: function(xhr,status,thrownError){
        console.log("failed to get passenger commute lat longs")
      },
      success: function(response){
        console.log(response)
        var passengerInfo = response;
        getPassengerCoordinates(passengerInfo);
      }
    }); 
  }

  function getPassengerCoordinates(passengerInfo){
    waypoints = []
    passenger_origin_info = passengerInfo["origin"];
    passenger_destination_info = passengerInfo["destination"];
    passenger_origin = new google.maps.LatLng(passenger_origin_info[0],passenger_origin_info[1]);
    passenger_destination = new google.maps.LatLng(passenger_destination_info[0],passenger_destination_info[1]);
    pushWayPt(passenger_origin);
    pushWayPt(passenger_destination);
    renderRoute();  
  }

  function pushWayPt(waypoint){
    waypoints.push({
    location:waypoint,
      stopover:true
    });
  }

  function renderRoute(){
    console.log(waypoints);
    var request = {
      origin: origin,
      destination: destination,
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


})





