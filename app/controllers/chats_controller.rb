class ChatsController < ApplicationController
  before_filter :require_user

  def show
    @messages = Message.last(10)
    @message = Message.new
  end

  private

  def require_user
    redirect_to :root unless session['username'] && session['dialect']
  end
end
