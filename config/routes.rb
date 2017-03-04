Rails.application.routes.draw do
  root to: 'users#new'
  resource :user
  resource :chat, only: :show
  mount ActionCable.server => '/cable'
end
