class MapController < ApplicationController
  def index
    @user = current_user
    @passenger_commute_ids = []
    @driver_commute_ids = []
    @user.passengercommutes.each_with_index do |commute,index|
      @passenger_commute_ids << [index,commute.id]
    end
    @user.drivercommutes.each_with_index do |commute,index|
      @driver_commute_ids << [index,commute.id]
    end
  end
end
