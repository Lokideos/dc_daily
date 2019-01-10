# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:lang)', lang: /en|ru/ do
    resources :general_reports do
      resources :data_hall_reports, shallow: true, except: %i[index]
    end
  end

  get '/:lang' => 'general_reports#index'
  root to: 'general_reports#index'
end
