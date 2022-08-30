require "open-uri"

puts "cleaning dataase..."
Country.destroy_all
Crag.destroy_all
User.destroy_all
Message.destroy_all
Chatroom.destroy_all
Trip.destroy_all
Activity.destroy_all
Review.destroy_all
Profile.destroy_all

# all of the data for the seeds
crags_data = [
                {
                  name: "Margalef",
                  lat: 1,
                  long: 2,
                  country: Country.where(name: "Spain")
                }
            ]
crags_photos = { Margalef: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661856531/go-climb-seeds/margalef-1_dka26r.jpg"
               }


#
#
#
# seeding the data
puts "seeding countries..."
Country.create(name: "Spain")
Country.create(name: "Germany")

puts "seeding crags..."
crags_data.each do |crag_data|
  crag = Crag.new(crag_data)
  photo = URI.open(crags_photos[crag.name])
  crag.photo.attach(io: photo, filename: "#{crag.name}.jpg", content_type: "image/jpg")
  crag.save!
end
