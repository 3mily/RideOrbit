Rails.application.routes.draw do
  root to: 'static#index'

  get "/newcommute", to: "static#newcommute", as: "newcommute"
  get "/commuteslist", to: "static#commuteslist", as: "commuteslist"
  get "/api/passengercommutes", to: "api_passenger_commutes#retrieve", as: "APIPassengerCommutes"

  resources :map, only: [:index]
  resource :session, only: [:new, :create, :destroy]

  resources :users

  resources :drivercommutes, only: [:create, :destroy, :update]
  resources :passengercommutes, only: [:create, :destroy, :update]
  resources :places, only: [:create, :destroy, :show, :index]
  resource :reviews, only: [:create, :destroy, :show]
  resources :requests, only: [:create, :destroy, :index, :update]
  resources :twilio, only: [:create, :index]
  
end