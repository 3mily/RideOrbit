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
    console.log(driverId);
    params = {
      "request_id": requestId,
      "drivercommute_id": drivercommuteId,
      "passengercommute_id": passengercommuteId,
      "driver_id": driverId,
      "passenger_id": passengerId
    }
    console.log(params);
    updateRequest(params);
    updateDriverCommute(params);
    updatePassengerCommute(params);
  });

  function updateRequest(params){
    $.ajax({
      url: "/requests/"+params["request_id"],
      type: "PATCH",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("it didnt save or work or something oh noes", thrownError);
      },
      success: function(response){
        console.log($(".accept").data("driver-id"));
      }
    });
  }

  function updateDriverCommute(params){
    $.ajax({
      url: "/drivercommutes/"+params["drivercommute_id"],
      type: "PATCH",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("it didnt save or work or something oh noes", thrownError);
      },
      success: function(response){
        console.log($(".accept").data("driver-id"));
      }
    });
  }

  function updatePassengerCommute(params){
    $.ajax({
      url: "/passengercommutes/"+params["passengercommute_id"],
      type: "PATCH",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("it didnt save or work or something oh noes", thrownError);
      },
      success: function(response){
        console.log($(".accept").data("driver-id"));
      }
    });    
  }

  $(".decline").on("click",function(){
    alert("hi decline");
    console.log($(".decline").data("driver-id"));
  });

})