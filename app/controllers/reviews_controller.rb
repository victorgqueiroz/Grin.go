class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    @trip = Trip.find(params[:trip_id])
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    @review.trip = @trip

    if @review.save
      redirect_to trip_path(@trip)
    else
      render "trips/index", status: :unprocessable_entity
    end
  end
end
