Rails.application.routes.draw do
  namespace :api do
    post '/register', to: 'registration#create'
    post '/login', to: 'session#create'
    delete '/logout', to: 'session#destroy'
    post '/signup', to: 'users#create'

  end
end 