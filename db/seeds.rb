# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

16.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"

  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               uid: n.to_s + "uid",
               )
end

n = 1
while n <= 16
  Topic.create(
    content: Faker::Superhero.name,
    user_id: n
  )

  Comment.create!(
    content: Faker::Superhero.power,
    user_id: n + 1,
    topic_id: n
  )

  n = n + 1
end
