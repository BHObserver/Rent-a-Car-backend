Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/register', to: 'registrations#create'
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      resources :users
      resources :reservations
      resources :cars, only: [:index, :create, :destroy] # Add this line
    end
  end
end
