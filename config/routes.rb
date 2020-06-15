Rails.application.routes.draw do
  resources :sessions
  resources :members
  resources :gym_classes
  resources :gyms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#home"

  get '/signup', to: "gyms#new", as: "signup"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: "logout"

end
