Rails.application.routes.draw do
  get 'days/index'
  get 'days/show'
  patch '/reservations/:id', to: 'reservations#cancel'
  root 'reservations#index'
  resources :reservations
end
