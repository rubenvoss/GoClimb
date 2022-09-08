def seed_profiles(profiles)
  profiles.each do |profile|
    # users and profiles have the same ids

    # if there is no last profile, make the first profile
    if Profile.last.nil?
      p = Profile.new(name: profile[:name], crag: Crag.all.sample, user: User.first,
                      bio: profile[:bio], age: profile[:age])
      photo = URI.open(profile[:url])
      p.photo.attach(io: photo, filename: "photo.jpg", content_type: "image/jpg")
      p.save!
      puts "profile for #{p.name} with id #{p.id} created"
      # if there is a last profile, make a profile with the user id 1 + last profile id
    elsif Profile.last
      # getting last profile id
      p = Profile.new(name: profile[:name], crag: Crag.all.sample,
                      user: User.find(Profile.last.id + 1), bio: profile[:bio], age: profile[:age])
      photo = URI.open(profile[:url])
      p.photo.attach(io: photo, filename: "photo.jpg", content_type: "image/jpg")
      p.save!
      puts "profile for #{p.name} with id #{p.id} created"
    end
  end
end
male_profiles = [
  # first profile is admin
  {
    name: "Ruben",
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662310752/go-climb-seeds/ruben_lod8sw.jpg",
    bio: "I loooove climbing, lived in front of the crag for a long time. I'm going on a big climbing trip to Margalef next week! come and join...",
    age: 23
  },
  {
    name: "Jasmien",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662031176/go%20climb%20profile%20pictures/omid-armin-D9RrI5IW9h0-unsplash_50_1_50_joecin.jpg",
    bio: "I am quite new to climbing but I learn fast 😊. I love traveling and discovering new places all over the world.",
    age: 29
  },
  {
    name: "Alex",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662561658/go%20climb%20profile%20pictures/man_1_35_bluwjn.jpg",
    age: 35
  },
  {
    name: "Joseph",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662562998/go%20climb%20profile%20pictures/Joseph_def_def_kgq4cq.jpg",
    age: 32
  },
  {
    name: "Max",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662031176/go%20climb%20profile%20pictures/omid-armin-D9RrI5IW9h0-unsplash_50_1_50_joecin.jpg",
    age: 23
  },
  {
    name: "Theo",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662029774/go%20climb%20profile%20pictures/petr-slovacek-YqVDdDkdFkw-unsplash_50_1_50_md4jrj.jpg",
    age: 31
  },
  {
    name: "Martin",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662030113/go%20climb%20profile%20pictures/tommy-lisbin-tl88ay2QxLU-unsplash_50_1_50_zjqcmw.jpg",
    age: 29
  },
  {
    name: "Connor",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662031008/go%20climb%20profile%20pictures/tommy-lisbin-zUHe9T8Zsj8-unsplash_50_1_50_kxzwdn.jpg",
    age: 36
  }
]
female_profiles = [
  {
    name: "Marie",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662561662/go%20climb%20profile%20pictures/woman_2_27_d6aae3.jpg",
    age: 26
  },
  {
    name: "Anna",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662562461/go%20climb%20profile%20pictures/anna_test_q3cqfl.jpg",
    age: 27
  },
  {
    name: "Carla",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662030519/go%20climb%20profile%20pictures/frances-gunn-fUpgJKCs1fw-unsplash_50_1_50_tzdwwj.jpg",
    age: 23
  },
  {
    name: "Shannon",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662030692/go%20climb%20profile%20pictures/jason-gardner-el88SU3-AQY-unsplash_50_f0o5w7.jpg",
    age: 20
  },
  {
    name: "Alice",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662030864/go%20climb%20profile%20pictures/elijah-hiett-ai7tP-odA2c-unsplash_1_50_e8pfqj.jpg",
    age: 27
  }
]

seed_profiles(male_profiles)

seed_profiles(female_profiles)
