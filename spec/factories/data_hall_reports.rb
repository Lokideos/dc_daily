# frozen_string_literal: true

FactoryBot.define do
  factory :data_hall_report do
    title { 'Data Hall Report Title' }
    general_report

    trait :invalid do
      title { nil }
    end
  end
end
