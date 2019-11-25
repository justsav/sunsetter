Rails.application.routes.draw do
  get 'locations/new'
  get 'locations/create'
  get 'locations/update'
  get 'days/index'
  devise_for :users
  root to: 'pages#home'

  resources :locations, only: [:new, :create, :update] do
   resources :weathers, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
