$ ->
  $messages = $('#messages')
  $messages.scrollTop $messages.prop('scrollHeight')
  $('#message_input').focus()

$(document).on 'keypress', '#message_input', (e) ->
  if e.keyCode == 13 and e.target.value
    App.room.speak(e.target.value, $('#messages').data('room-id'))
    e.target.value = ''
    e.preventDefault()
