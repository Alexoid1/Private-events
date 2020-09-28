Rails.application.routes.draw do
  resources :events
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:new,:create, :index,:show]
  resources :sessions
  resources :invitations
  root "users#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
