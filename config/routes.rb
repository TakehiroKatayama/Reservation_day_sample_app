Rails.application.routes.draw do
  get 'days/index'
  get 'days/show'
  post 'reservations/update' => 'reservations#update'
  root 'reservations#index'
  resources :reservations
end
