Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :locations, only: [:new, :create, :update] do

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
