# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'flights#index'
  resources :flights, only: :index
  resources :bookings, only: %i[new create show]
end
