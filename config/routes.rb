# frozen_string_literal: true

Rails.application.routes.draw do
  root 'routines#index'
  devise_for :users
  resources :exercises
  resources :routines
end
