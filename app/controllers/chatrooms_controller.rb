class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    chatroom = (Chatroom.where(first_user: current_user, second_user: User.find([params[:user_id]])).or(Chatroom.where(second_user: current_user, first_user: User.find([params[:user_id]])))).first
    if chatroom.blank?
      chatroom = Chatroom.new
      chatroom.first_user = current_user
      chatroom.second_user = User.find(params[:user_id])
      chatroom.save!
    end
    redirect_to chatroom_path(chatroom)
  end
end
