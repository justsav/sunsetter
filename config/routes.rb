Rails.application.routes.draw do

  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  get 'bookings/index'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'bookings/edit'
  get 'booking/new'
  get 'booking/create'
  get 'booking/show'
  get 'booking/index'
  get 'booking/update'
  get 'booking/destroy'
  get 'booking/edit'
  root to: 'pages#home'

  devise_for :users

  resources :cities, only: [:index] do
    resources :places, only: [:index]
  end
  resources :sunsets, only: [:index]
  resources :places, except: [:index]
end
