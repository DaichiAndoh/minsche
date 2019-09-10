Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'members#new'
  resources :members, only: :create
  
  get 'join', to: 'groups#join'
  post 'join', to: 'groups#create_join'
  resources :groups, only: [:new, :create, :edit, :update, :destroy] do
    resources :schedules
    resources :members, only: [:index, :destroy]
  end
end