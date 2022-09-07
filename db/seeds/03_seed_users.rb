def seed_users
  20.times do |index|
    User.create! ({
      email: "user@user#{index}.com",
      password: "123456"
    })
  end
end

seed_users
