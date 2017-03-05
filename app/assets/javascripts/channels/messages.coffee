jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  active_users = $('#active-users')
  if $('#messages').length > 0
    refresh_users_list = (username, user)->
      listed_user = active_users.find('*[data-username="' + username + '"]')
      unless listed_user.length > 0
        active_users.append user

    App.global_chat = App.cable.subscriptions.create {
        channel: "MessagesChannel"
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']
        refresh_users_list data['username'], data['user']

      send_message: (message, user) ->
        @perform 'send_message', text: message, user: user

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_text')
      user = $this.find('#message_user')
      if $.trim(textarea.val()).length > 0
        App.global_chat.send_message textarea.val(), user.val()
        textarea.val('')
      e.preventDefault()
      return false
