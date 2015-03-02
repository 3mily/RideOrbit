class ReviewsController < ApplicationController
  def show
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to users_path
    else
    end
  end

  #helper
  def review_params
    params.require(:review).permit(:drivercommute_id, :passengercommute_id, :reviewee_id, :reviewer_id, :rating, :body)
  end
end
