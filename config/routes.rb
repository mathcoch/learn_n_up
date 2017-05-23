Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'lessons#index'

  resources :lessons, only: [:new, :create, :index, :show] do
    resources :meetings, only: [:create]
  end
end
