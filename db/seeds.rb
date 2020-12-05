require 'open-uri'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

puts "Begining seeds"

Rent.destroy_all
Bike.destroy_all
User.destroy_all
puts "Deleted all users, bikes and rents"

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
