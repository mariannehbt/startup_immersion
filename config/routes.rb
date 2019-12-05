Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static_pages#home"

  devise_for :users

  resources :newsletters
  resources :activities
  resources :situations
  resources :startups
  resources :events
  resources :attendances

  get 'static_pages/home'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
