require 'open-uri'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

puts "Begining seeds"

Bike.destroy_all
User.destroy_all
puts "Deleted all users and bikes"

puts "Creating users"
4.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  puts user
end
puts "4 users created"

puts "Creating bikes:"

# d_one = "Marin San Rafael DS1"
# d_two = "Specialized Women’s Sirrus V-Brake"
# d_three = "Aventon Electric: Pace 350 Step Through - 2020"
# d_four = "Specialized A1 Premium Aluminum, Ground Control Positioning, formed tubes, V-brake, fender/rack mount"
# d_five = "Liv Pique Advanced Pro 29"
# d_six = "Mongoose Impasse Mens Mountain Bike, 29-Inch Wheels, Aluminum Frame, Twist Shifters, 21-Speed Rear Deraileur, Front and Rear Disc Brakes"
# description_array = [d_one, d_two, d_three, d_four, d_five, d_six]

6.times do
  url = "https://source.unsplash.com/collection/19669960/600x400"
  file = URI.open(url)
  filename = File.basename(URI.parse(url).path)
  bike = Bike.create!(
    description: Faker::Lorem.sentence(word_count: 8, supplemental: true, random_words_to_add: 3),
    user: User.all.sample,
    address: Faker::Address.street_address,
    title: "#{Faker::Adjective.positive} bike".capitalize,
    price: 5
  )
  bike.photo.attach(io: file, filename: filename)
  puts bike
end

puts "6 bikes created."
puts "Images attached"
