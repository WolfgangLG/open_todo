FactoryGirl.define do
  pw = Faker::Lorem.word
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password_digest pw
  end
end
