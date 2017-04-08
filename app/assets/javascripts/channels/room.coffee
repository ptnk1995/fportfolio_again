jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0

    App.room = App.cable.subscriptions.create {
      channel: "RoomChannel"
      room_id: messages.data('room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data
        messages.scrollTop messages.prop('scrollHeight')

      speak: (message, room_id) ->
        @perform 'speak', message: message, room_id: room_id
