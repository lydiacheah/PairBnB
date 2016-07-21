Rails.application.routes.draw do
  
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

  resources :listings, only: [:index, :new, :edit, :update, :show, :create] do
    resources :reservations 
  end

  # get '/users/:user_id/listings/:id', to: "listings#profile", as: "listing_profile"
end


