Rails.application.routes.draw do

  root to: 'welcome#index'

  resource :session, only: [:new, :create, :destroy]

  resources :users do
    resource :places, only: [:create, :new, :destroy]
    resource :map 
    resource :commute, only: [:create, :new, :destroy]
  end

end
