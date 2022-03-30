# frozen_string_literal: true

FactoryBot.define do
  factory :routine do
    name { Faker::Name.unique.name }
  end
end
