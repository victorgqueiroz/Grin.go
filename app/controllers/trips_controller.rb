class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @trips = @user.trips
    @review = Review.new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
    @review = Review.new  # Add this line
  end

  def new
    @user = User.find(params[:user_id])
    @trip = Trip.new
    @places = Place.where(city: @user.city)
  end

  def create
    @user = User.find(params[:user_id])
    @trip = Trip.new
    @place = Place.find(trip_params[:place_id])
    @trip.user = @user
    @trip.place = @place
    @trip.legend = trip_params[:legend]
    if @trip.save
      redirect_to @trip, notice: 'Trip was successfully created.'
    else
      @places = Place.all
      render :new
    end
  end

  def edit
    @places = Place.all # Aqui carregamos todos os lugares para a view
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Trip was successfully updated.'
    else
      @places = Place.all
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_url, notice: 'Trip was successfully destroyed.'
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:user_id, :place_id, :legend)
  end
end
