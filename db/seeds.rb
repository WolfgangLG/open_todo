User.create!(
  name: "Ludwig Gerdes",
  email: "gerdesludwig@gmail.com",
  password_digest: "password"
)

5.times do
  User.create!(
    name:            Faker::Name.name,
    email:           Faker::Internet.email,
    password_digest: Faker::Lorem.word
  )
end
users = User.all

# Create Lists
25.times do
  List.create!(
    user:         users.sample,
    public:       Faker::Boolean.boolean(0.5),
    title:        Faker::Hipster.word,
    description:  Faker::Hipster.sentence(3)
  )
end
lists = List.all

# Create Items
50.times do
  Item.create!(
    list:   lists.sample,
    name:   Faker::Lorem.word,
    body:   Faker::Hipster.paragraph(2)
  )
end
items = Item.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
