# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    title { 'MyString' }
    description { 'MyText' }

    trait :invalid do
      title { nil }
    end
  end
end
