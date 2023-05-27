class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @coffee.update(place_params) #caso user prop do place permitir update
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path, status: :see_other
  end

  # def my
  #   @places = Place.where(user: current_user)
  # end

  # def market
  #   @coffees = Coffee.global_search(params[:query])
  #   @coffees = Coffee.all if @coffees.empty?

  #   # @coffees = Coffee.all
  # end

  private

  def place_params
    params.require(:place).permit(:cities, :countries, :neighborhood)
  end
end
