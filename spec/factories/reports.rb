# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    title { 'Report Title' }
    description { 'Report Description' }

    trait :invalid do
      title { nil }
    end
  end
end
