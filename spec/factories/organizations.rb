FactoryGirl.define do
  factory :organization do
    sequence(:name) {|n| "Organization_#{n}" }
  end
end
