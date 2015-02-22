Rails.application.routes.draw do

  root to: 'welcome#index'

  resource :session, only: [:new, :create, :destroy]

  resources :users
  resources :commutes
  resources :places, only: [:create, :destroy, :show, :index]
  resource :reviews, only: [:create, :destroy]
  resource :requests, only: [:create, :destroy]

  get "/map", to: "users#map", as: "map"


end
