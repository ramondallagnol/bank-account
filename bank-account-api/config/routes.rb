Rails.application.routes.draw do
  resources :transactions
  resources :accounts
  resources :clients
  resources :clientes
  resources :banks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
