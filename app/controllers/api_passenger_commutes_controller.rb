
class ApiPassengerCommutesController < ApplicationController
  def retrieve
    if params["commuter"] == "driver"
      @commutes = Passengercommute.within_origin(params["commute_id"]).within_destination(params["commute_id"])
    elsif params["commuter"] == "passenger"
      @commutes = Drivercommute.within_origin(params["commute_id"]).within_destination(params["commute_id"])
    end
    render json: @commutes
  end
end

