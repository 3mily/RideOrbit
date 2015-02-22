Rails.application.routes.draw do

  root to: 'welcome#index'

  resource :session, only: [:new, :create, :destroy]

  resources :users do
    resource :places, only: [:create, :destroy, :show]
    resources :commutes, only: [:create, :new, :destroy, :show] do
      resource :reviews, only: [:create, :destroy]
      resource :requests, only: [:create, :destroy]
    end
    get "/map", to: "users#map", as: "map"
  end

end
