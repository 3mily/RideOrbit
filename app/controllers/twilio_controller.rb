require 'pry'
class TwilioController < ApplicationController

  def index
  end

  def create
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from_number = ENV['TWILIO_NUMBER']
    if params["initiated_by_id"]
      sender = User.find(params["initiated_by_id"])
      @recipient1_name = sender.firstname
      @recipient1_number = sender.phone
    end
    @recipient2_name = params["request_receiver_name"]

    @recipient2_number = params["request_receiver_phone"]
    if params["status"] == "accept"

      @recipient1_number = "+17783231717"
      @recipient2_number = "+17789776806"
      recipient1_body = "Hi #{@recipient1_name}, your RideOrbit commute has been finalized! You'll be commuting with #{@recipient2_name}, who can be reached at #{@recipient2_number}. Happy networking!"
      recipient2_body = "Hi #{@recipient2_name}, your RideOrbit commute has been finalized! You'll be commuting with #{@recipient1_name}, who can be reached at #{@recipient1_number}. Happy networking!"

      send_text(@recipient1_number, recipient1_body)
      send_text(@recipient2_number, recipient2_body) 

    else
      @recipient2_number = "+17789776806"
      body = "Hi #{@recipient2_name}, someone has made a request on RideOrbit to connect with you! Go check it out to accept or decline." 

      send_text(@recipient2_number, body)
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