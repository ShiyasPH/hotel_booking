Rails.application.routes.draw do
  root  'static_pages#home'
  devise_for :users
  resources :hotels, only: [:index]
  resources :bookings, only: [:new, :create, :index, :destroy]
end