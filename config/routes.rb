Rails.application.routes.draw do
  root to: 'users#new'
  resource :user
  mount ActionCable.server => '/cable'
end
