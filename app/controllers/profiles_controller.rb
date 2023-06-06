class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def my
    @trips = current_user.trips
    @review = Review.new
    @trip = Trip.new
  end

  
end
