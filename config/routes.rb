Rails.application.routes.draw do
  resources :importers, only: :create
end
