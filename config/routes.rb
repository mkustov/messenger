Rails.application.routes.draw do
  root to: 'users#new'
  resource :user, only: %i(new create)
  resource :chat, only: :show
  resources :messages, only: :create
  mount ActionCable.server => '/cable'
end
