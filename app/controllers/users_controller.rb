class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @reviews = Review.where(reviewee_id: current_user.id)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.phone = "+"+params["phone1"]+params["phone2"]+params["phone3"]

    if @user.save
      session[:user_id] = @user.id
      flash[:alert] = "Welcome aboard, #{@user.firstname}!"
      redirect_to places_path
    else
      render :new
    end
  end

  def show
    @user = User.where(id: params[:id]).first
    @users = User.all
    @review = Review.new
    @reviews = Review.where(reviewee_id: params[:id])
  end

  # helper method
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :bio, :password, :password_confirmation, :picture)
  end

  
end
