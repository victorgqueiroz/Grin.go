class ProfilesController < ApplicationController
  before_action :set_place, only: [:show]


  def show
    @user = User.find(params[:id])
    @trips = Trip.where(user: @user)
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
