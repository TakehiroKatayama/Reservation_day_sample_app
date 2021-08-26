Rails.application.routes.draw do
  resources :days
  get '/reservation_of_day/:id', to: 'days#reservation_of_day'
  patch '/reservations/:id', to: 'reservations#cancel'
  root 'reservations#index'
  resources :reservations
end
