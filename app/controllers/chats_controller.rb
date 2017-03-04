class ChatsController < ApplicationController
  def show
    @messages = Message.last(10)
    @message = Message.new(user: session[:username])
  end
end