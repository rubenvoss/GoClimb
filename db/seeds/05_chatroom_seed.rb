def seed_chatrooms
  puts "seeding chatrooms..."
  5.times do
    name = Profile.all.sample.name
    Chatroom.create(name: name)
    puts "chatroom with name #{name} created"
  end
end

seed_chatrooms
