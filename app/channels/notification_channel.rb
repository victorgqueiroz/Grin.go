class NotificationChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:id])
    stream_for user
  end

  def received(data)
    # Enviar a mensagem recebida para os assinantes
    transmit(data)
  end


end
