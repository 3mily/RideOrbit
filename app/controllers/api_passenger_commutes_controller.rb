
class ApiPassengerCommutesController < ApplicationController
  def retrieve
    @passengercommutes = Passengercommute.within_origin(params["commute_id"]).within_destination(params["commute_id"])
    render json: @passengercommutes
  end
end

