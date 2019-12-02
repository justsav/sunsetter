Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  get 'send_message_sms', to: 'bookings#send_message_sms'

  resources :cities, only: [:index] do
    resources :places, only: [:index]
  end
  resources :sunsets, only: [:index]
  resources :places, except: [:index]
  resources :bookings do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, except: [:index, :new, :create]
end
