class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params['room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'], user: current_user, room_id: data['room_id']
  end
end
