Rails.application.routes.draw do
  devise_for :users
  root 'bookings#index'
  get 'bookings/show'
  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
