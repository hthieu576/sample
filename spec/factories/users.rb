# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    trait :with_account do
      after(:create) do |user|
        create(:account, user: user, name: Faker::Name.name, balance: 1000)
      end
    end
  end
end
