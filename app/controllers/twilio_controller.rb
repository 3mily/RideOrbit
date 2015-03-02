class TwilioController < ApplicationController

  def create


end


  function updateDriverCommute(){
    $.ajax({
      url: "/twilio",
      type: "PUT",
      data: params,
      error: function(xhr,status,thrownError){
        console.log("it didnt save or work or something oh noes", thrownError);
      },
      success: function(response){
        console.log("success - twilio text send"t
      }
    });
  }