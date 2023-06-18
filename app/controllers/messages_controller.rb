class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )

      NotificationChannel.broadcast_to(
        @chatroom.first_user == current_user ? @chatroom.second_user : @chatroom.first_user,
        { chatroom_id: @chatroom.id, content: @message.content, name: @message.user.name }
      )

      head :ok
    else
      render 'chatrooms/show'
    end
  end

  def destroy
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
