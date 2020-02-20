Rails.application.routes.draw do
  get 'statics/index'
  root 'events#index'
  resources :events do
    resources :attendances, only: [:index, :new, :create, :destroy]
  end
  resources :charges
  devise_for :users
  resources :users, only: [:show]
end
