class CommutesController < ApplicationController
  def index
  end

  def new
    @current_user = current_user
    hour = params[:hour].to_i
    minutes = params[:minutes]

    if params[:am_pm] == "12"
      hour += 12
    end

    @driver_commute = Drivercommute.new
    @passenger_commute = Passengercommute.new
  end
end
