class MatchesController < ApplicationController
  before_action :authenticate_user!


  def new
    @match = Match.new
    @guider = User.find(params[:user_id])
    @places = @guider.trips.map { |trip| trip.place }
  end

  def create
    @match = Match.new
    @guider = User.find(params[:user_id])
    @place = Place.find(params[:match][:place])
    @match.guider = @guider
    @match.user = current_user
    @match.place = @place
    if @match.save
      #@chatroom = chatroom.create(parametros do chat)
      flash[:notice] = "Convite Enviado!"
      redirect_to user_path(@guider)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
