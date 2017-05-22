Rails.application.routes.draw do
  devise_for :users
  root to: 'lessons#index'

  resources :lessons, only: [:new, :create, :index, :show]
end
