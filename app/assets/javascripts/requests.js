$(function(){

  $("#commutes-select-toggle").on("click", function(){
    $("#requests-as-passenger").toggle();
    $("#requests-as-driver").toggle();
  });

  $(".accept").on("click", function(e){
    alert("hi accept");
    var driverId = $(".accept").data("driver-id");
    var requestId = $(".accept").data("request-id");
    var passengerId = $(".accept").data("passenger-id");
    var passengercommuteId = $(".accept").data("passenger-commute-id");
    var drivercommuteId = $(".accept").data("driver-commute-id")
    params = {
      "text_type": "accept"
      "request_id": requestId,
      "drivercommute_id": drivercommuteId,
      "passengercommute_id": passengercommuteId,
      "driver_id": driverId,
      "passenger_id": passengerId,
      "status": "accept"
    }
    updateRequest();
    updateDriverCommute();
    updatePassengerCommute();
    // sendAcceptText();
  });

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


  $(".decline").on("click",function(){
    alert("hi decline");
    params["status"]="decline";
    declineRequest();
  });

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