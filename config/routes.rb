Rails.application.routes.draw do

  root to: 'welcome#index'

  resource :session, only: [:new, :create, :destroy]

  resources :users
  resources :commutes
  get "/drivercommute", to: "commutes#new", as: "drivercommutes"
  post "/drivercommute", to: "commutes#create" as: "new_drivercommutes"
  get "/passengercommute", to: "commutes#new", as: "passengercommutes"
  post "/passengercommute", to: "commutes#create" as: "new_passengercommutes"
  resources :places, only: [:create, :destroy, :show, :index]
  resource :reviews, only: [:create, :destroy]
  resource :requests, only: [:create, :destroy]

  get "/map", to: "users#map", as: "map"


end
