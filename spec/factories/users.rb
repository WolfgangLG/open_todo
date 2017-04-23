FactoryGirl.define do
  pw = Faker::Lorem.characters(10)
  factory :user do
    name Faker::Name.name
    sequence(:email){|n| "user#{n}@open_todo.com" }
    password pw
    password_confirmation pw
  end
end
