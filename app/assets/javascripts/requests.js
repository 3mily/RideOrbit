$(function(){

  $("#commutes-select-toggle").on("click", function(){
    $("#requests-as-passenger").toggle();
    $("#requests-as-driver").toggle();
  });

  $(".accept").on("click", function(){
    alert("hi accept");
    var initiator = $(".accept").data("initiator");
    console.log(initiator);

    var params = {
      "initiator": initiator
    }

    $.ajax({
        url: "/requests#update",
        type: "POST",
        data: params,
        error: function(xhr,status,thrownError){
          console.log("it didnt save or work or something oh noes", thrownError);
        },
        success: function(response){
          console.log($(".accept").data("initiator"));
        }
      });
  });

  $(".decline").on("click",function(){
    alert("hi decline");
    console.log($(".decline").data("initiator"));
  });

})