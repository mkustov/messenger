class ChatsController < ApplicationController
  def show
    @messages = Message.last(10)
    @message = Message.new
  end
end