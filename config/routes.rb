Rails.application.routes.draw do
  devise_for :users
  root to: 'lessons#index'

  resources :lessons, only: [:new, :create, :index, :show] do
    resources :meetings, only: [:create]
  end
end
