class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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
    @trip = Trip.new
  end

  def create

    @trip = current_user.trips.new(trip_params.except(:place))
    @place = current_user.places.new(place_params[:trip][:place])
    @place.country = ISO3166::Country[params[:trip][:place][:country]].iso_short_name
    if @place.save
      @trip.place = @place
    end

    if @trip.save
      # Redirecionar ou renderizar como apropriado
      redirect_to my_path, notice: 'Trip was successfully created.'
    else
      # Manipular falha na validação
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    if params[:trip][:photos] != [""]
      @trip.photos.purge
      @trip.photos.attach(params[:trip][:photos])
    end
    if @trip.update(trip_params.except(:photos))
      redirect_to my_path, notice: 'Trip was successfully updated.'
    else
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
      params.require(:trip).permit(:place_id, :legend, photos: [])
    end

    def place_params
      params.permit(trip: {place: [:city, :country, :neighborhood]})
    end

end
