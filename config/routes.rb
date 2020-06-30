Rails.application.routes.draw do
  resources :gyms
  resources :sessions
  resources :members
  resources :gym_classes do 
    resources :scheduled_classes, only: [:index, :new, :create, :destroy]
  end
  
  #Github Authentication
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  
  #Homepage
  root "application#home"
  
  #Login/Logout
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: "logout"
  
  #Gym SignUp + Dashboard + Today Page
  get "/dashboard", to: "gyms#dashboard", as: "dashboard"
  get '/signup', to: "gyms#new", as: "signup"
  get "/today", to: "gyms#today", as: "todays_classes"
  
  # Deletes
  ## GymClass
  delete "/gym_classes/:id", to: "gym_classes#destroy", as: "destroy_gym_class"
  
  ## Member
  delete "/members/:id", to: "members#destroy", as: "destroy_member"

  # Cancels a class (destroys all scheduled_classes that match a certain time)
  delete "/gym_classes/:gym_class_id/scheduled_classes/:id", to: "scheduled_classes#destroy", as: "cancel_class"


  #Catchall if invalid route/URL
  get "*path", to: redirect("/")
end
