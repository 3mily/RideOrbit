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
    debugger;
    var clickedButton = $(this)
    var insideText = clickedButton.text()
    $("#map-canvas").toggleClass("hidden");
    clickedButton.text(insideText == "Show Route" ? "Hide Route" : "Show Route");
    if (insideText == "Show Route"){
      initialize(clickedButton);
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
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  }

  function initDirections(){
    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('directions-panel'));
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
        console.log(response)
      }
    }); 
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
      }
    }); 
  }






})





