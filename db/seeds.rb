require "open-uri"
require 'faker'

puts "cleaning dataase..."
Crag.destroy_all
Country.destroy_all
Chatroom.destroy_all
Message.destroy_all
Activity.destroy_all
Review.destroy_all
Profile.destroy_all
Trip.destroy_all

# leave this commented if you want to stay logged in as an admin user
# User.destroy_all

puts "seeding admin user - admin@admin.com - 123456"
User.create(email: "admin@admin.com", password: "123456")

puts "seeding countries..."
spain = Country.create(name: "Spain")
germany = Country.create(name: "Germany")

# all of the data for the crags
crags_data = [
  {
    name: "Margalef",
    lat: 41.284320,
    long: 0.754540,
    country: spain
  },
  {
    name: "Siurana",
    lat: 41.258560,
    long: 0.931420,
    country: spain
  },
  {
    name: "Oberammergau",
    lat: 47.596418,
    long: 11.071603,
    country: germany
  }
]

# IMPORTANT: the symbol has to match exactly the crag name in crags_data
crags_photos = { Margalef: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661856531/go-climb-seeds/margalef-1_dka26r.jpg",
                 Siurana: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661857164/go-climb-seeds/1080px-Siurana_Kirche_do28pr.jpg",
                 Oberammergau: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661857179/go-climb-seeds/P1060004-1_gycg9f.jpg"
}

puts "seeding crags..."
crags_data.each do |crag_data|
  crag = Crag.new(crag_data)
  photo = URI.open(crags_photos[crag_data[:name].to_sym])
  crag.photo.attach(io: photo, filename: "#{crag_data[:name].delete(' ')}.jpg", content_type: "image/jpg")
  crag.save
  puts "crag #{crag.name} with id:#{crag.id} #{crag.valid? ? 'saved' : 'not saved'}"
end

puts "seeding users..."
10.times do
  User.new(email: "#{Faker::Name.first_name}@gmail.com", encrypted_password: Faker::Alphanumeric.alphanumeric(number: 10))
end

puts "seeding chatrooms..."
crags_data.each do |crag|
  chatroom_name = crag[:name]
  Chatroom.new(name: chatroom_name)
end
