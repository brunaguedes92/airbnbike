# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

puts "Begining seeds"

Bike.destroy_all
User.destroy_all
puts "Deleted all users and bikes"

puts "Creating users"
6.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  puts user
end
puts "10 users created"

puts "Creating bikes:"

first = Bike.create!(
  address: Faker::Address.street_address,
  description: "Marin San Rafael DS1",
  user: User.all.sample
)
second = Bike.create!(
  address: Faker::Address.street_address,
  description: "Specialized Women’s Sirrus V-Brake",
  user: User.all.sample
)

third = Bike.create!(
  address: Faker::Address.street_address,
  description: "Aventon Electric: Pace 350 Step Through - 2020",
  user: User.all.sample
)

forth = Bike.create!(
  address: Faker::Address.street_address,
  description: "Specialized A1 Premium Aluminum, Ground Control Positioning, formed tubes, V-brake, fender/rack mount",
  user: User.all.sample
)

fifth = Bike.create!(
  address: Faker::Address.street_address,
  description: "Liv Pique Advanced Pro 29",
  user: User.all.sample
)

sixth = Bike.create!(
  address: Faker::Address.street_address,
  description: "Mongoose Impasse Mens Mountain Bike, 29-Inch Wheels, Aluminum Frame, Twist Shifters, 21-Speed Rear Deraileur, Front and Rear Disc Brakes",
  user: User.all.sample
)

puts "Six bikes created."

puts "Begining to attach photo"
url = "https://res.cloudinary.com/sartoriando/image/upload/v1607027529/bikes/01_ervaui.jpg"
file = URI.open(url)
filename = File.basename(URI.parse(url).path)
first.photo.attach(io: file, filename: filename)

puts "photo criated"
