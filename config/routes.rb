# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:lang)', lang: /en|ru/ do
    resources :reports
  end

  get '/:lang' => 'reports#index'
  root to: 'reports#index'
end
