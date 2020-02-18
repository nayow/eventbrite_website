# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
User.destroy_all
Attendance.destroy_all

10.times do
  User.create(
    'first_name' => Faker::Name.first_name,
    'last_name' => Faker::Name.last_name,
    'description' => Faker::Quote.most_interesting_man_in_the_world,
    'email' => Faker::Internet.email,
    'password' => Faker::String.random(length: 6)
  )
end

10.times do
  Event.create(
    'start_date' => Faker::Time.forward(days: 300),
    'duration' => [15,20,25,30,35,40,45,50,55].sample,
    'title' => Faker::Lorem.word,
    'description' => Faker::Lorem.paragraph,
    'price' => Faker::Number.between(from: 1, to: 1000),
    'location' => Faker::Address.city,
    'admin_id' => rand(User.first.id..User.last.id)
  )
end

10.times do
  Attendance.create(
    'user_id' => rand(User.first.id..User.last.id),
    'event_id' => rand(Event.first.id..Event.last.id)
  )
end
