
class ApiPassengerCommutesController < ApplicationController
  def retrieve
    earth_degree = params["search_radius"].to_f/params["DEGREE"].to_f
    if params["commuter"] == "driver"
      @commutes = Passengercommute.within_origin(params["commute_id"],earth_degree).within_destination(params["commute_id"],earth_degree)
    elsif params["commuter"] == "passenger"
      @commutes = Drivercommute.within_origin(params["commute_id"],earth_degree).within_destination(params["commute_id"],earth_degree)
    end
    render json: @commutes
  end
end

