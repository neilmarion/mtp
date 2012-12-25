FactoryGirl.define do
  factory :office do
    sequence(:name) {|n| "Office_#{n}" }
  end
end
