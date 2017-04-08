class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_#{message.room.id}_channel", render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render message
  end
end
