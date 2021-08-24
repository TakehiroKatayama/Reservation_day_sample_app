Rails.application.routes.draw do
  resources :days
  patch '/reservations/:id', to: 'reservations#cancel'
  root 'reservations#index'
  resources :reservations
end
