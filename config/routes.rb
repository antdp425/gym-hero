Rails.application.routes.draw do
  resources :members
  resources :g_members
  resources :gym_classes
  resources :gyms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#home"
end
