# frozen_string_literal: true

Rails.application.routes.draw do
  root 'routines#index'
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  resources :exercises
  resources :routines
end
