class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    @trip = Trip.find(params[:user_id])
    @user = User.find(params[:user_id])
    @review = Review.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    @review.trip = @trip

    if @review.save
      redirect_to trip_path(@trip)
    else
      render "trips/index", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id, :trip_id)
  end
end
