class CommutesController < ApplicationController
  def index
    @driver_commute = Drivercommute.new
    @passenger_commute = Passengercommute.new
  end
end
