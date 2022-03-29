# frozen_string_literal: true

Rails.application.routes.draw do
  resources :routines
  devise_for :users
  root 'routines#index'
end
