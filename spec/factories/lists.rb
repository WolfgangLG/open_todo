FactoryGirl.define do
  factory :list do
    user
    permission Faker::Number.between(0, 2)
    title Faker::Hipster.word
    description Faker::Hipster.sentence(3)
  end
end
