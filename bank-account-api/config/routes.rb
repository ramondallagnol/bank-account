Rails.application.routes.draw do
  resources :clients
  resources :transactions, except: [:update]
  resources :accounts, only: [:show] do
    collection do
      get 'balance'
    end
  end
  post '/auth/login', to: 'authentication#login'
end
