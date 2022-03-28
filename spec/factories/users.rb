# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "User"}
    email { "example@example.com"}
    password { "password" }
  end
end
