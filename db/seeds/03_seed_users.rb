def seed_users
  10.times do |index|
    User.create ({
      email: "user@user#{index}",
      password: "123456"
    })
  end
end



seed_users
