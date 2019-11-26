Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users
  resources :cities, only: [:index] do
    resources :places

  end
  resources :sunsets, only: [:index]

end
