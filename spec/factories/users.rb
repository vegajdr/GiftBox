FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gentoo.com" }
    sequence(:username) { |n| "username#{n}"}
    password "hunter2"
  end
end
