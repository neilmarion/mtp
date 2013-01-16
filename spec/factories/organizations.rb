FactoryGirl.define do
  factory :organization do
    sequence(:name) {|n| "Organization_#{n}" }
    type_of_children "children"
  end
end
