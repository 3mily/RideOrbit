
class ApiPassengerCommutesController < ApplicationController
  def retrieve
    @passengercommutes = Passengercommute.all
    render json: @passengercommutes
  end
end
