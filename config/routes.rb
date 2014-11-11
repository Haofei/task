Rails.application.routes.draw do
  post 'activities/create'
  get 'activities/user_count'

  root to: 'visitors#index'
  devise_for :users
  resources :users
end