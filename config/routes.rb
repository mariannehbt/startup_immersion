Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#home'

  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :avatars, only: [:create]
  end

  resources :startups, only: [:index, :show, :create, :update, :destroy]

  resources :events, only: [:index, :show, :create, :update, :destroy] do
    resources :attendances, except: :index
  end


<<<<<<< HEAD
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

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
=======
  resources :events do
    resources :attendances
    collection do
      get :search
    end
  end


  get 'static/home'
  get '/gallery', to: 'static#gallery'
  # get '/search' => 'events#search', :as => 'search_page'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
>>>>>>> 66093e14cba2823c0a41401f4dd5dcc5271f0af7

end
