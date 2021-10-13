Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users, only: %i[new create]
  resources :logins, only: %i[new create]
end
