# frozen_string_literal: true

FactoryBot.define do
  factory :exercise do
    description { Faker::Name.name }
    intensity { Faker::Number.between(from: 0, to: 10) }
  end
end
