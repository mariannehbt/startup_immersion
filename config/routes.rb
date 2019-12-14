Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#home'

  devise_for :users
  resources :users, only: [:show, :index, :edit, :update, :destroy] do
    resources :avatars, only: [:create]
  end

  resources :startups

  resources :events, only: [:index, :show, :create, :update, :destroy] do
    resources :attendances, except: :index
    collection do
      get :search
    end
  end

  namespace :admin do
    root 'admin#index'
    resources :users
    resources :startups
    resources :events do
      resources :attendances
    end
  end

  scope module: 'admin' do
    resources :activities
    resources :situations
  end

  resources :newsletters

  get 'static/home'
  get '/gallery', to: 'static#gallery'

end
