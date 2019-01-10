# frozen_string_literal: true

FactoryBot.define do
  factory :temperature_report do
    title { 'Temperature Report Title' }
    general_report

    trait :invalid do
      title { nil }
    end
  end
end
