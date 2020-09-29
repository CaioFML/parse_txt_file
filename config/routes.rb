Rails.application.routes.draw do
  resources :sales, only: :index
  resources :importers, only: :create

  root "sales#index"
end
