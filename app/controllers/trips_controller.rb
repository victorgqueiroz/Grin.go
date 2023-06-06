class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @user = User.find(params[:user_id])
    @trips = @user.trips
    @review = Review.new
    @trip = Trip.new
  end

  def show
    @user = User.find(params[:id])
    @review = Review.new  # Add this line
  end
end
