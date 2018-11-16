Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :destroy, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  # resources :bands, only: [:index, :edit, :create, :new, :show, :update, :destroy]
