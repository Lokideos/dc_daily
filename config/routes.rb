# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:lang)', lang: /en|ru/ do
    resources :reports do
      resources :temperature_reports, shallow: true
    end
  end

  get '/:lang' => 'reports#index'
  root to: 'reports#index'
end
