# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    user
    name { Faker::Name.name }
    balance 10000
  end
end
