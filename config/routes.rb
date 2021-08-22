Rails.application.routes.draw do
  get 'days/index'
  get 'days/show'
  root 'reservations#index'
  resources :reservations
end
