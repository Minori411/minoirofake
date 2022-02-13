Rails.application.routes.draw do
  get 'home/index'
  get 'sessions/new'

  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'

  get  'signup',  to: 'users#new'
  post 'signup', to: 'users#create'


  root :to => "home#index"
  
  get "sample", to: "sample#index"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
