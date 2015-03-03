class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to user_path(@review.reviewee_id)
    else
    end
  end

  def destroy
    @review = Review.where(reviewer_id: params[:reviewer_id]).first
    if @review.destroy
      redirect_to user_path(@review.reviewee_id)    
    end
  end

  #helper
  def review_params
    params.require(:review).permit(:drivercommute_id, :passengercommute_id, :reviewee_id, :reviewer_id, :rating, :body)
  end
end
