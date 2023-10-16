# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :logins, only: %i[new create]

  resources :users, only: %i[create] do
    get 'profile', to: 'profiles#show'
    patch 'profile', to: 'profiles#update'

    get 'contents/:id', to: 'contents#show'
    post 'contents', to: 'contents#create'
    patch 'contents/:id', to: 'contents#update'
  end
end
