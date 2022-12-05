Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/profile", to: "pages#profile"
  get "/calendar", to: "pages#calendar"

  resources :doggies, only: %i[new create update]
  resources :medications, except: %i[edit destroy]
  delete "/medications/:id", to: "medications#destroy", as: :destroy_medication
end
