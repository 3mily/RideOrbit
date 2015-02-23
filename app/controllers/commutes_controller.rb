class CommutesController < ApplicationController
  def index
  end

  def new
    @driver_commute = Drivercommute.new
    @passenger_commute = Passengercommute.new
  end
end
