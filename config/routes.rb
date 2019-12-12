Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#home'

  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :avatars, only: [:create]
  end

  namespace :admin do
    root 'admin#index'
    resources :users
  end

  scope module: "admin" do
    resources :activities
    resources :situations
  end

  resources :newsletters
  resources :startups

  resources :events do
    resources :attendances
  end

  get 'static/home'

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
