Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :days
  get '/reservation_of_day/:id', to: 'days#reservation_of_day'
  patch '/reservations/:id', to: 'reservations#cancel'
  root 'days#index'
  resources :reservations
end
