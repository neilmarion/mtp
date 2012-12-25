FactoryGirl.define do
  factory :person do
    sequence(:last_name) {|n| "dela Cruz_#{n}" }
    sequence(:first_name) {|n| "Neil Marion_#{n}" }
    sequence(:middle_name) {|n| "Flores_#{n}" }
  end
end
