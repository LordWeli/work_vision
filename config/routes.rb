Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :logins, only: %i[new create]

  resources :users, only: %i[create] do
    get 'profile', to: 'profiles#show'
    patch 'profile', to: 'profiles#update'

    post 'contents', to: 'contents#create'
  end
end
