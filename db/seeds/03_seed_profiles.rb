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
