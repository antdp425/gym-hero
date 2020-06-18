Rails.application.routes.draw do
  resources :gyms
  resources :sessions
  resources :members
  resources :gym_classes do 
    resources :scheduled_classes, only: [:new, :create, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  root "application#home"
  get "/dashboard", to: "gyms#dashboard", as: "dashboard"

  get '/signup', to: "gyms#new", as: "signup"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: "logout"

  get "/today", to: "gyms#today", as: "todays_classes"

  get "*path", to: redirect("/")
end
