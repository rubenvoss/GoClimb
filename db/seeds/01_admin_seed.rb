def seed_user
  puts "seeding admin user - admin@admin.com - 123456"
  admin_user = User.create(email: "admin@admin.com", password: "123456")
end

def seed_profile
  puts "seeding admin profile"
  admin_profile_photo = "https://res.cloudinary.com/dqdezmage/image/upload/v1662029176/go%20climb%20profile%20pictures/omid-armin-Y5jCPXa1HdM-unsplash_50_p3xoxu.jpg"
  admin_profile = Profile.create(name: "admin", user: User.first)
  photo = URI.open(admin_profile_photo)
  admin_profile.photo.attach(io: photo, filename: "photo.jpg", content_type: "image/jpg")
  puts "created admin profile with id #{admin_profile.id}"
end



seed_user
seed_profile
