class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    @trip = Trip.find(params[:trip_id])

    @review = Review.new(review_params)
    @review.user = current_user
    @review.trip = @trip

    if @review.save
      redirect_to my_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @review = Review.new(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
