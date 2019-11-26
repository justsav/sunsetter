Rails.application.routes.draw do


  root to: 'pages#home'

  devise_for :users

  resources :cities, only: [:index] do
    resources :places, only: [:index]
  end
  resources :sunsets, only: [:index]
  resources :places, except: [:index]
  resources :bookings
end
