Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'members#new'
  resources :members, only: [:new, :create]
end
