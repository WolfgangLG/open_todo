FactoryGirl.define do
  factory :item do
    list
    name Faker::Name.name
    body Faker::Hipster.paragraph(2)
    completed Faker::Boolean.boolean(0.5)
  end
end
