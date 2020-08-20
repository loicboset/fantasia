class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    authorize @review
    if @review.save!
      redirect_to profile_path
    else
      redirect_to profile_path
    end
  end


  private

  def reviews_params
    params.require(:review).permit(:user_review, :rating, :booking_id)
  end
end
