FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gentoo.com" }
    sequence(:username) { |n| "username#{n}"}
    password "hunter2"
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end
end
