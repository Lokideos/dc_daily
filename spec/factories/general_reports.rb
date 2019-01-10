# frozen_string_literal: true

FactoryBot.define do
  factory :general_report do
    title { 'General Report Title' }
    description { 'General Report Description' }

    trait :invalid do
      title { nil }
    end
  end
end
