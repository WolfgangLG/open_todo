FactoryGirl.define do
  factory :list do
    user
    title Faker::Hipster.word
    description Faker::Hipster.sentence(3)
    permission Faker::Number.between(0, 2)
  end
end
