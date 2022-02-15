Rails.application.routes.draw do

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 

devise_scope :user do
  get "user/:id", :to => "users/registrations#detail"
  get "signup", :to => "users/registrations#new"
  post "signup", :to => "users/registrations#create"
  get "login", :to => "users/sessions#new"
  post 'login', to: 'users/sessions#create'
  get "logout", :to => "users/sessions#destroy"
end
  get "users/index", to: "users#index"

  root :to => "home#index"
  
  get "sample", to: "sample#index"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
