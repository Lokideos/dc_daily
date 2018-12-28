# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reports

  root to: 'reports#index'
end
