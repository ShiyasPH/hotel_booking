Rails.application.routes.draw do
  devise_for :users
  get 'users/new'
  root 'static_pages#home'
  resources :users
end