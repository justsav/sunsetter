Rails.application.routes.draw do
  get 'cities/show'
  get 'cities/index'
  root to: 'pages#home'

  devise_for :users
  resources :places
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
