require "open-uri"

puts "cleaning dataase..."
Crag.destroy_all
Country.destroy_all
Chatroom.destroy_all
Message.destroy_all
Activity.destroy_all
Review.destroy_all
Profile.destroy_all
Trip.destroy_all
User.destroy_all

puts "seeding admin user - admin@admin.com - 123456"
User.create(email: "admin@admin.com", password: "123456")

puts "seeding countries..."
spain = Country.create(name: "Spain")
germany = Country.create(name: "Germany")

# all of the data for the crags
crags_data = [
  {
    name: "Margalef",
    lat: 1,
    long: 2,
    country: spain
  }
]
crags_photos = { Margalef: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661856531/go-climb-seeds/margalef-1_dka26r.jpg"
}

puts "seeding crags..."
crags_data.each do |crag_data|
  crag = Crag.new(crag_data)
  photo = URI.open(crags_photos[crag_data[:name].to_sym])
  crag.photo.attach(io: photo, filename: "#{crag_data[:name]}.jpg", content_type: "image/jpg")
  crag.save!
end
