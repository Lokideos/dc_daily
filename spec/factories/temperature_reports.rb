# frozen_string_literal: true

FactoryBot.define do
  factory :temperature_report do
    title { 'MyString' }

    trait :invalid do
      title { nil }
    end
  end
end
