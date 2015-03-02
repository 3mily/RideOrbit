$(function(){
  $("#commutes-type-toggle").on("click", function(){
    $("#passengers-commutes-list").toggleClass("hidden");
    $("#drivers-commutes-list").toggleClass("hidden");
  });
  $(".connected").on("click", function(){
    // $(this).toggleClass("hidden");
  });

  $(".delete_commute").on("click", function(e){
    var that = this;
    var params = {
      "id": $(".delete_commute").data("commute-id")
    }
    $.ajax({
      url: '/passengercommutes/'+params["id"],
      method: "DELETE",
      dataType: 'json',
      data: params,
      error: function(xhr,status,thrownError){
        console.log("fail")
      },
      success: function(response){
        console.log(response)
        $(that).closest(".commute").hide();
      }
    });
  });
});