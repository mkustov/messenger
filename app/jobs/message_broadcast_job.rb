class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'messages',
                                 message: render_message(message),
                                 username: message.user,
                                 user: render_user(message.user)
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: { message: message }
  end

  def render_user(user)
    UsersController.render partial: 'users/user', locals: { user: author(user) }
  end

  def author(user)
    ActionCable.server.connections.map(&:current_user).detect { |u| u[:username] == user }
  end
end
