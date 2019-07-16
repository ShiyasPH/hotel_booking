Rails.application.routes.draw do
  root                'static_pages#home'
  get  'new_reservation'  =>'static_pages#new_reservation'
  get 'users/new'
  devise_for :users
  resources :users
end