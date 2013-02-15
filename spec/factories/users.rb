FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user_#{n}@email.com" }
    sequence(:password) {|n| "12345678#{n}" }
    sequence(:password_confirmation) {|n| "12345678#{n}" }
  end
end
