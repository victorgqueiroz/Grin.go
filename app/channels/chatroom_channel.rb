class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def received(data)
    # Enviar a mensagem recebida para os assinantes
    transmit(data)
  end
end
