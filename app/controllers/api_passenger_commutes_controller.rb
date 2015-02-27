
class ApiPassengerCommutesController < ApplicationController
  def retrieve
    # binding.pry
    # @passengercommutes = Passengercommute.all
    @passengercommutes = Passengercommute.within_origin(params["commute_id"])
    # binding.pry
    render json: @passengercommutes
  end
end



    # binding.pry