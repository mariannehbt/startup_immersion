Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#home'

  resources :newsletters, only: [:new, :create]

  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :avatars, only: [:create]
  end

  resources :startups, only: [:index, :show, :create, :update, :destroy]

  resources :events, only: [:index, :show, :create, :update, :destroy] do
    resources :attendances, except: :index
  end


  namespace :admin do
    root 'admin#index'
    resources :users
    resources :startups
    resources :events do
      resources :attendances
    end
    resources :attendances_submissions, only: [:index]
  end

<<<<<<< HEAD
  scope module: 'admin' do
    resources :newsletters, except: :create
    resources :activities
    resources :situations
=======
  resources :events do
    resources :attendances
    collection do
      get :search
    end
>>>>>>> front
  end


<<<<<<< HEAD
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
=======
  get 'static/home'
  get '/gallery', to: 'static#gallery'
  # get '/search' => 'events#search', :as => 'search_page'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
>>>>>>> front

end
