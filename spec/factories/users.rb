FactoryGirl.define do
  pw = Faker::Lorem.word
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password pw
    password_confirmation pw
  end
end
