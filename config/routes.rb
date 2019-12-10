Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#home'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :avatars, only: [:create]
  end

  resources :newsletters
  resources :activities
  resources :situations
  resources :startups

  resources :events do
    resources :attendances
  end

  get 'static/home'
  get '/search' => 'events#search', :as => 'search_page'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
