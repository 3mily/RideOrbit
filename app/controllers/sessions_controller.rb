class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Log in failed :("
      render :new
    end
    # user = User.first

    # session[:user_id] = user.id
    # redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    # render nothing: true, status: 204
    redirect_to root_path
  end
end