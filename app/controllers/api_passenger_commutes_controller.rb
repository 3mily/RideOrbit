
class ApiPassengerCommutesController < ApplicationController
  def retrieve
    binding.pry
    @passengercommutes = Passengercommute.all
    render json: @passengercommutes
  end
end


    # @passengercommutes = Passengercommute.within_origin(current_user.id)
    # binding.pry