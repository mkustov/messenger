class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
  end

  def show
  end

  private

  def chat_params
  end
end
