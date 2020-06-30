Rails.application.routes.draw do
  resources :gyms
  resources :sessions
  resources :members
  resources :gym_classes do 
    resources :scheduled_classes, only: [:index, :new, :create, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  
  root "application#home"
  
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: "logout"
  
  get "/dashboard", to: "gyms#dashboard", as: "dashboard"
  get '/signup', to: "gyms#new", as: "signup"
  get "/today", to: "gyms#today", as: "todays_classes"
  
  delete "/gym_classes/:id", to: "gym_classes#destroy", as: "destroy_gym_class"
  
  delete "/members/:id", to: "members#destroy", as: "destroy_member"
  
  get "*path", to: redirect("/")
end
