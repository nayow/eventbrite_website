Rails.application.routes.draw do

  get 'statics/index'
  root 'events#index'

  resources :events do
    resources :attendances, only: [:index, :new, :create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :charges

  namespace :admin do
    root 'users#index'
    resources :users
  end

end
