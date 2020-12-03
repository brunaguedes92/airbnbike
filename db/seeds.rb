# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Begining seeds - users"

User.destroy_all
puts "Deleted all users"

puts "Creating users"
30.times do
  user = User.create (
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  puts user
end
puts "30 users created"

puts "Creating bikes:"
first = {
  address: Faker::Address.street_address,
  description: "Marin San Rafael DS1",
  user_id: (1..30).rand
}

second = {
  address: Faker::Address.street_address,
  description: "Specialized Women’s Sirrus V-Brake",
  user_id: (1..30).rand
}

third = {
  address: Faker::Address.street_address,
  description: "Aventon Electric: Pace 350 Step Through - 2020",
  user_id: (1..30).rand
}

forth = {
  address: Faker::Address.street_address,
  description: "Specialized A1 Premium Aluminum, Ground Control Positioning, formed tubes, V-brake, fender/rack mount",
  user_id: (1..30).rand
}

fifth = {
  address: Faker::Address.street_address,
  description: "Liv Pique Advanced Pro 29", 
  user_id: (1..30).rand
}

sixth = {
  address: Faker::Address.street_address,
  description: "Mongoose Impasse Mens Mountain Bike, 29-Inch Wheels, Aluminum Frame, Twist Shifters, 21-Speed Rear Deraileur, Front and Rear Disc Brakes",
  user_id: (1..30).rand
}

[first, second, third, forth, fifth, sixth].each do |attr|
  new_bike = Bike.create!(attr)
end

puts "Six bikes created."