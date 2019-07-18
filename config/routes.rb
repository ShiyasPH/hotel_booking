Rails.application.routes.draw do
  root                'static_pages#home'
  get 'users/new'
  devise_for :users
  resources :users
  resources :hotels
	resources :bookings, only: [:new, :create, :index]
end