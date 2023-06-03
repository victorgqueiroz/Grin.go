class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @user = User.find(params[:user_id])
    @trips = @user.trips
  end
end
