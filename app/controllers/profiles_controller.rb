class ProfilesController < ApplicationController
  before_action :set_place, only: [:show, :edit]


  def show
    # @user = User.find(params[:id])
    @trips = Trip.where(user: @user)
  end

  def edit
    # @user = User.find(params[:id])
  end

  def my
    @trips = current_user.trips
    @review = Review.new
    @trip = Trip.new
    @user = current_user
  end

private

def set_place
  @user = User.find(params[:id])
end


end
