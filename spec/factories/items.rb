FactoryGirl.define do
  factory :item do
    name "MyString"
    purchased? false
    wishlist
    # user_interests nil
    # user_holidays nil
  end
end
