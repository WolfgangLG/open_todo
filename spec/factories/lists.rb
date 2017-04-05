FactoryGirl.define do
  factory :list do
    user
    public Faker::Boolean.boolean(0.5)
    title Faker::Hipster.word
    description Faker::Hipster.sentence(3)
  end
end
