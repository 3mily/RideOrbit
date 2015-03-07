class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user


  def commute_requests(commute)
    if commute.requests
      commute.requests.each do |request|
        if request.approved_at.nil? && request.rejected_at.nil? && request.initiated_by_id != current_user.id
          @existing_requests += 1     
        end
      end
    end
  end


  def has_requests
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @existing_requests = 0
    if @current_user.drivercommutes
      @current_user.drivercommutes.each do |commute|
        commute_requests(commute)
        @existing_requests/2
      end
    end
    if @current_user.passengercommutes
      @current_user.passengercommutes.each do |commute|
        commute_requests(commute)
      end
    end
    @existing_requests > 0
  end
  helper_method :has_requests

  def existing_requests
    @existing_requests
  end

  helper_method :existing_requests


end