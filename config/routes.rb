Rails.application.routes.draw do
  resources :attendances
  resources :events
  resources :startups
  resources :users
  resources :situations
  resources :activities
  resources :newsletters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
