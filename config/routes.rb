Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users,
                 path: '',
                 path_names: {
                   sign_in: 'login',
                   sign_out: 'logout',
                   registration: 'register'
                 },
                 controllers: {
                   sessions: 'api/v1/sessions',
                   registrations: 'api/v1/registrations'
                 }

      resources :reservations
      resources :cars, only: [:index, :show, :create, :destroy]
    end
  end
end
