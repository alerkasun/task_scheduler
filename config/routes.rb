Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'

  resources :tasks do
    patch :update_status, on: :member
  end
end