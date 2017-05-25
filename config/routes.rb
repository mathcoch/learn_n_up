Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'lessons#index'

  get 'users/profile', to: 'users#show', as: :user

  resources :lessons, only: [:new, :create, :index, :show, :destroy] do
    collection do
      get 'category/:category', to: "lessons#category"
    end
    resources :meetings, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :meetings, only: [:show, :destroy, :update]
end
