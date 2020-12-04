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
10.times do
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

one = "https://res.cloudinary.com/sartoriando/image/upload/v1607027529/bikes/01_ervaui.jpg"
two = "https://res.cloudinary.com/sartoriando/image/upload/v1607027529/bikes/02_qj8sot.jpg"
three = "https://res.cloudinary.com/sartoriando/image/upload/v1607027529/bikes/03_lvm3cj.jpg"
four = "https://res.cloudinary.com/sartoriando/image/upload/v1607027529/bikes/04_sdjloh.jpg"
five = "https://res.cloudinary.com/sartoriando/image/upload/v1607027529/bikes/05_sbrvdq.jpg"
six = "https://res.cloudinary.com/sartoriando/image/upload/v1607027529/bikes/06_toiaax.jpg"
url_array = [one, two, three, four, five, six]

d_one = "Marin San Rafael DS1"
d_two = "Specialized Women’s Sirrus V-Brake"
d_three = "Aventon Electric: Pace 350 Step Through - 2020"
d_four = "Specialized A1 Premium Aluminum, Ground Control Positioning, formed tubes, V-brake, fender/rack mount"
d_five = "Liv Pique Advanced Pro 29"
d_six = "Mongoose Impasse Mens Mountain Bike, 29-Inch Wheels, Aluminum Frame, Twist Shifters, 21-Speed Rear Deraileur, Front and Rear Disc Brakes"
description_array = [d_one, d_two, d_three, d_four, d_five, d_six]

address = Faker::Address.street_address

url_array.each_with_index do |url, i|
  file = URI.open(url)
  filename = File.basename(URI.parse(url).path)
  bike = Bike.create!(description: description_array[i], user: User.all.sample, address: address, title: "Sensational bike", price: 5)
  bike.photo.attach(io: file, filename: filename)
  puts bike
  # bike.save   ativar se em lugar de create for new
end

puts "Six bikes created."

puts "Images attached"
