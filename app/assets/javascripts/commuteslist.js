$(function(){
  $("#commutes-type-toggle").on("click", function(){
    $("#passengers-commutes-list").toggleClass("hidden");
    $("#drivers-commutes-list").toggleClass("hidden");
  });
  $(".connected").on("click", function(){
    // $(this).toggleClass("hidden");
  });

//will reload for now, but add jquery animation to move things to proper spot later
  $(".delete_passenger_commute").on("click", function(e){
    var that = this;
    var params = {
      "id": that.getAttribute("data-commute-id")
    }
    var url = '/passengercommutes/'+params["id"]
    deleteCommute(params,url,that);
  });

  $(".delete_driver_commute").on("click",function(e){
    var that = this;
    var params = {
     "id": that.getAttribute("data-commute-id")
    }
    var url = '/drivercommutes/'+params["id"]
    deleteCommute(params,url,that);
  })  

  function deleteCommute(params,url,clicked){
    $.ajax({
      url: url,
      method: "DELETE",
      dataType: 'json',
      data: params,
      error: function(xhr,status,thrownError){
        console.log("fail")
      },
      success: function(response){
        console.log(response)
        $(clicked).closest(".commute").hide();
      }
    });    
  }
});