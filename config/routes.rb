# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'flights#index'
  resources :flights, only: %i[new index]
end
