require 'pry'
class TwilioController < ApplicationController

  def index
  end

  def create
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from_number = ENV['TWILIO_NUMBER']
    @recepient1_name = current_user.firstname

    @recepient2_name = params["request_receiver"]["name"]
    @recepient1_number = current_user.phone
    @recepient2_number = params["request_receiver"]["phone"]

    if params["status"] == "accept"
      @recepient1_number = "+17783231717"
      @recepient2_number = "+17789776806"
      recepient1_body = "Hi #{@recepient1_name}, your RideOrbit commute has been finalized! You'll be commuting with #{@recepient2_name}, who can be reached at #{@recepient2_number}. Happy networking!"
      recepient2_body = "Hi #{@recepient2_name}, your RideOrbit commute has been finalized! You'll be commuting with #{@recepient1_name}, who can be reached at #{@recepient1_number}. Happy networking!"

      send_text(@recepient1_number, recepient1_body)
      send_text(@recepient2_number, recepient2_body) 

    else
      @recepient2_number = "+17789776806"
      body = "Hi #{@recepient2_name}, someone has made a request on RideOrbit to connect with you! Go check it out to accept or decline." 

      send_text(@recepient2_number, body)
    end

    render json: {
      "status": 200,
      "message": "text sent!"
    }
  end

  def send_text(to_number,body)
    @client.account.messages.create(
      :from => @from_number, 
      :to => to_number, 
      :body => body
    )
  end

end