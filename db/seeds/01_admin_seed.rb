def seed_user
  puts "seeding admin user - admin@admin.com - 123456"
  admin_user = User.create(email: "admin@admin.com", password: "123456")
end

seed_user
