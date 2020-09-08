Rails.application.routes.draw do
  resources :gyms, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :members
  resources :gym_classes do 
    resources :scheduled_classes, only: [:index, :new, :create, :destroy]
  end

  ################################################################
  
  #Github Authentication
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  
  ################################################################

  # Home
  ## Not Signed In
  root "application#home"

  ## Signed In
  get "/dashboard", to: "gyms#dashboard", as: "dashboard"

  ## Signed In -- Today View
  get "/today", to: "gyms#today", as: "todays_classes"
  
  ################################################################

  # Login/Logout
  get '/login', to: "sessions#new", as: "login"
  delete '/logout', to: "sessions#destroy", as: "logout"

  ################################################################
  
  # Gym SignUp
  get '/signup', to: "gyms#new", as: "signup"

  ################################################################

  # Destroys
  ## GymClass
  delete "/gym_classes/:id", to: "gym_classes#destroy", as: "destroy_gym_class"
  
  ## Member
  delete "/members/:id", to: "members#destroy", as: "destroy_member"

  ## Cancels a class (destroys all scheduled_classes that match a certain time)
  delete "/gym_classes/:gym_class_id/scheduled_classes/:id", to: "scheduled_classes#destroy", as: "cancel_class"

################################################################

# Catchall if invalid route/URL
  get "*path", to: redirect("/")

################################################################
end
