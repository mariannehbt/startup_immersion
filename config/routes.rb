Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#home'

  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :avatars, only: [:create]
  end

  resources :startups, only: [:index, :show, :create, :update, :destroy]

  resources :events, only: [:index, :show, :create, :update, :destroy] do
    resources :attendances
  end


  namespace :admin do
    root 'admin#index'
    resources :users
    resources :startups
    resources :events
  end

  scope module: "admin" do
    resources :activities
    resources :situations
  end






  resources :newsletters
  



  get 'static/home'

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
