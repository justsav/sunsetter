Rails.application.routes.draw do


  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'
  root to: 'pages#home'

  devise_for :users

  resources :cities, only: [:index] do
    resources :places, only: [:index]
  end
  resources :sunsets, only: [:index]
  resources :places, except: [:index]
  resources :bookings do
    resources :reviews, only: [:index]
  end
  resources :reviews, except: [:index]
end
