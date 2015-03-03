$(function(){

  $("#commutes-select-toggle").on("click", function(){
    $("#requests-as-passenger").toggle();
    $("#requests-as-driver").toggle();
  });

  $(".accept").on("click", function(){
    var clicked = $(this);
    getInfo(clicked);
    updateRequest();
    updateDriverCommute();
    updatePassengerCommute();
    // sendAcceptText();
  });

  $(".decline").on("click",function(){
    var clicked = $(this).siblings(".accept");
    getInfo(clicked);
    params["status"]="decline";
    declineRequest();
  });

  // $(".disconnect").on("click",function(){
  //   var clicked = this.closest(".accept");
  //   getInfo(clicked);
  //   params["status"]="decline";
  //   declineRequest();
  // })

  function getInfo(clicked){
    var driverId = $(clicked).data("driver-id");
    var requestId = $(clicked).data("request-id");
    var passengerId = $(clicked).data("passenger-id");
    var passengercommuteId = $(clicked).data("passenger-commute-id");
    var drivercommuteId = $(clicked).data("driver-commute-id")
    params = {
      "text_type": "accept",
      "request_id": requestId,
      "drivercommute_id": drivercommuteId,
      "passengercommute_id": passengercommuteId,
      "driver_id": driverId,
      "passenger_id": passengerId,
      "status": "accept"
    }
  }

  function updateRequest(){
    $.ajax({
      url: "/requests/"+params["request_id"],
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

  function declineRequest(){
    $.ajax({
      url: "/requests/"+params["request_id"],
      type: "PATCH",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("didn't decline", thrownError)
      },
      success: function(response){
        console.log("decline success")
      }
    });
  }

})