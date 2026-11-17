Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users, only: %i[new create]
  resources :profiles, only: %i[show edit update]
  resources :logins, only: %i[new create]

  get  "/auth/:provider/callback", to: "logins#omniauth"
  get  "/auth/failure", to: "logins#failure"
end
