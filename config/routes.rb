Rails.application.routes.draw do


  root to: 'cities#index'

  devise_for :users
  resources :places
  resources :sunsets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
