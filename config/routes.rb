Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :days
  get '/reservation_of_day/:id', to: 'days#reservation_of_day'
  patch '/reservations/:id', to: 'reservations#cancel'
  get '/day_edit/:id', to: 'reservations#day_edit'
  patch '/day_edit/:id', to: 'reservations#day_update'
  root 'days#index'
  resources :reservations
end
