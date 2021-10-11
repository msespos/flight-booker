Rails.application.routes.draw do
  root to: 'flights#index'
  resources :flights, only: [:new, :index]
end
