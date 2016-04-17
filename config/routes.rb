Rails.application.routes.draw do
  resources :towns
  resources :attractions
  root :to => 'towns#index'
end
