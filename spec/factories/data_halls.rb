# frozen_string_literal: true

FactoryBot.define do
  factory :data_hall do
    title { 'Data Hall Title' }
    description { 'Data Hall Description' }
    data_hall_report

    trait :invalid do
      title { nil }
    end
  end
end
