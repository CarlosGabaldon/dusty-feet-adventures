FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "carlos#{n}@parametertechnologies.com"}
    password "password"
  end
end
