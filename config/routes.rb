Rails.application.routes.draw do
  
  get 'payments/new'

  root 'listings#index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users, only: [:show, :edit, :update, :destroy] 

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth", as: "facebook"

  get "/users/:id/listings", to: "users#user_listings", as: "user_listings"
  get "users/:id/reservations", to: "users#user_reservations", as: "user_reservations"

  resources :listings do
    resources :reservations, only: [:new, :edit, :update, :create, :destroy]
  end

  get "/search", to: "listings#search", as: "listings_search"

  resources :payments, only: [:new, :create]
  
end


