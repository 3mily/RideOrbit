Rails.application.routes.draw do

  root to: 'static#index'

  get "/newcommute", to: "static#newcommute", as: "newcommute"
  get "/commuteslist", to: "static#commuteslist", as: "commuteslist"

  resource :session, only: [:new, :create, :destroy]

  resources :users

  resources :drivercommutes, only: [:create, :destroy]
  resources :passengercommutes, only: [:create, :destroy]
  resources :places, only: [:create, :destroy, :show, :index]
  resource :reviews, only: [:create, :destroy]
  resource :requests, only: [:create, :destroy]
  resource :map, only: [:index]

end