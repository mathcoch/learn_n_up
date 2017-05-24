Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'lessons#index'

  get 'users/profile', to: 'users#show', as: :user

  resources :lessons, only: [:new, :create, :index, :show, :destroy] do
    resources :meetings, only: [:create]
  end
  resources :meetings, only: [:destroy]
end
