def seed_users
  5.times do
    User.create ({
      male_first_name: Faker::Name.male_first_name,
      last_name: Faker::Name.last_name,
      crag: Crag.all.sample
    })
  end
end




seed_users
