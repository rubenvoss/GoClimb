require "open-uri"
require 'faker'

puts "cleaning database..."
Profile.destroy_all
Trip.destroy_all
Crag.destroy_all
Country.destroy_all
Message.destroy_all
Chatroom.destroy_all
Activity.destroy_all
Review.destroy_all

# leave this commented if you want to stay logged in as an admin user
# User.destroy_all

puts "seeding admin user - admin@admin.com - 123456"
admin_user = User.create(email: "admin@admin.com", password: "123456")

spain = Country.create(name: "Spain")
germany = Country.create(name: "Germany")
turkey = Country.create(name: "Turkey")

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
  },
  {
    name: "Geyikbayiyri",
    lat: 36.874830,
    long: 30.464940,
    country: turkey
  },
  {
    name: "Kochel",
    lat: 47.659489,
    long: 11.364970,
    country: germany
  },
  {
    name: "Weißmain-Alb",
    lat: 50.172751,
    long: 10.956809,
    country: germany
  },
  {
    name: "Oliana",
    lat: 42.067390000000046,
    long: 1.3136700000000587,
    country: spain
  }
]

# IMPORTANT: the symbol has to match exactly the crag name in crags_data
crags_photos = { Margalef: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661856531/go-climb-seeds/margalef-1_dka26r.jpg",
                 Siurana: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661857164/go-climb-seeds/1080px-Siurana_Kirche_do28pr.jpg",
                 Oberammergau: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661857179/go-climb-seeds/P1060004-1_gycg9f.jpg",
                 Geyikbayiyri: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661939067/go-climb-seeds/geyikbayiri-2015-02-19_frzsid.jpg",
                 Kochel: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661984493/go-climb-seeds/kochel_dhoneh.jpg",
                 'Weißmain-Alb': "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661984692/go-climb-seeds/Wei%C3%9Fmain-Alb_sooadi.jpg",
                 Oliana: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661986800/go-climb-seeds/Oliana_k0ehyb.jpg",

}.stringify_keys

puts "seeding crags..."
crags_data.each do |crag_data|
  crag = Crag.new(crag_data)
  photo = URI.open(crags_photos[crag_data[:name]])
  crag.photo.attach(io: photo, filename: "#{crag_data[:name].delete(' ')}.jpg", content_type: "image/jpg")
  # add country to crag name
  crag.name = "#{crag.name}, #{crag.country.name}"
  crag.save
  puts "crag #{crag.name} with id:#{crag.id} #{crag.valid? ? 'saved' : 'not saved'}"
end

puts "seeding admin profile"
admin_profile_photo = "https://res.cloudinary.com/dqdezmage/image/upload/v1662029176/go%20climb%20profile%20pictures/omid-armin-Y5jCPXa1HdM-unsplash_50_p3xoxu.jpg"
admin_profile = Profile.create(name: "admin", crag: Crag.first, user: admin_user)
photo = URI.open(admin_profile_photo)
admin_profile.photo.attach(io: photo, filename: "photo.jpg", content_type: "image/jpg")
puts "created admin profile with id #{admin_profile.id}"

puts "seeding chatrooms..."
crags_data.each do |crag_data|
  chatroom_name = crag_data[:name]
  Chatroom.create(name: chatroom_name)
end

# IMPORTANT: the symbol has to match exactly the crag name in crags_data
male_profile_photos = [
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662031176/go%20climb%20profile%20pictures/omid-armin-D9RrI5IW9h0-unsplash_50_1_50_joecin.jpg",
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662031008/go%20climb%20profile%20pictures/tommy-lisbin-zUHe9T8Zsj8-unsplash_50_1_50_kxzwdn.jpg",
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662030113/go%20climb%20profile%20pictures/tommy-lisbin-tl88ay2QxLU-unsplash_50_1_50_zjqcmw.jpg",
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662029774/go%20climb%20profile%20pictures/petr-slovacek-YqVDdDkdFkw-unsplash_50_1_50_md4jrj.jpg",
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662030258/go%20climb%20profile%20pictures/mihajlo-sebalj-swfJN1URFzA-unsplash_50_whpy63.jpg"
]

female_profile_photos = [
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662030864/go%20climb%20profile%20pictures/elijah-hiett-ai7tP-odA2c-unsplash_1_50_e8pfqj.jpg",
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662030692/go%20climb%20profile%20pictures/jason-gardner-el88SU3-AQY-unsplash_50_f0o5w7.jpg",
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662030519/go%20climb%20profile%20pictures/frances-gunn-fUpgJKCs1fw-unsplash_50_1_50_tzdwwj.jpg",
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662029941/go%20climb%20profile%20pictures/emma-smith-9Bv0OzPxcOI-unsplash_50_sgqmmp.jpg",
  "https://res.cloudinary.com/dqdezmage/image/upload/v1662028670/go%20climb%20profile%20pictures/khamkhor--I-McziCxxM-unsplash_50_wnumu1.jpg"
]

puts "seeding male users and profiles..."
male_users_data = []
crags = Crag.all
5.times do
  male_users_data << {
    male_first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    crag: crags.sample
  }
end

male_users = []
male_profiles = []
index = 0
male_users_data.each do |male_user_data|
  user = User.create(
    email: "#{male_user_data[:male_first_name]}.#{male_user_data[:last_name]}@gmail.com",
    password: Faker::Alphanumeric.alphanumeric(number: 10)
  )
  male_users << user
  puts "male user with id #{user.id} created"
  male_profile = Profile.create(name: male_user_data[:male_first_name], crag: male_user_data[:crag], user: user)
  male_profiles << male_profile
  photo = URI.open(male_profile_photos[index])
  male_profile.photo.attach(io: photo, filename: "photo.jpg", content_type: "image/jpg")
  puts "male profile for #{male_user_data[:male_first_name]} with id #{male_profile.id} created"
  index += 1
end

puts "seeding female users and profiles..."
female_users_data = []
crags = Crag.all
5.times do
  female_users_data << {
    female_first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    crag: crags.sample
  }
end

female_users = []
female_profiles = []
index = 0
female_users_data.each do |female_user_data|
  user = User.create(
    email: "#{female_user_data[:female_first_name]}.#{female_user_data[:last_name]}@gmail.com",
    password: Faker::Alphanumeric.alphanumeric(number: 10)
  )
  female_users << user
  puts "female user with id #{user.id} created"
  female_profile = Profile.create(name: female_user_data[:female_first_name], crag: female_user_data[:crag], user: user)
  female_profiles << female_profile
  photo = URI.open(female_profile_photos[index])
  female_profile.photo.attach(io: photo, filename: "photo.jpg", content_type: "image/jpg")
  puts "female profile for #{female_user_data[:female_first_name]} with id #{female_profile.id} created"
  index += 1
end

# seeding messages only for checking layout purposes in development

# puts "seeding messages..."
# users = User.all
# chatrooms = Chatroom.all
# users.each do |user|
#   chatrooms.each do |chatroom|
#     10.times do
#       Message.create(content: Faker::Lorem.sentence, user: user, chatroom: chatroom)
#     end
#   end
# end
