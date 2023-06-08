class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present? && params[:search][:query].present?
      @places = Place.global_search(params[:search][:query])
    else
      @places = Place.all.first(6)
    end
    @trips = @places # ou outra variável dependendo do contexto
  end

  # def index
  #   if params[:query]
  #     @place = Place.global_search(params[:query])
  #   else
  #     @place = Place.all.first(6)
  #   end
  # end

  def show
    @place = Place.find(params[:id])
    @users = User.where(city: @place.city)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @place = Place.find(params[:id]) está no método privado
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # @place = Place.find(params[:id]) está no método privado
    @place.destroy
    redirect_to places_url, notice: 'Place was successfully destroyed.'
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:cities, :countries, :neighborhood)
  end
end

# def my
#   @places = Place.where(user: current_user)
# end

# def market
#   @coffees = Coffee.global_search(params[:query])
#   @coffees = Coffee.all if @coffees.empty?

#   # @coffees = Coffee.all
# end
