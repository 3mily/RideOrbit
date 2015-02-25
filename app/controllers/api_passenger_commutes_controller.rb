class ApiPassengerCommutesController < ApplicationController
  def retrieve
    @users = User.all
    render json: @users
  end
end
