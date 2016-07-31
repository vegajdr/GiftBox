FactoryGirl.define do
  factory :wishlist do
    sequence(:name) { |n| "Wishlist#{n}"}
    user
  end
end
