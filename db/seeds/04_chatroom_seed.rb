puts "seeding chatrooms..."
5.times do
  user = User.all.sample
  binding.pry
  name = user.profile.name
  Chatroom.create(name: name)
end
