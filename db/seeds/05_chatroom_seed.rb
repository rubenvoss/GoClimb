def seed_chatrooms
  puts "seeding chatrooms..."
  names = ["Jasmien", "Ruben", "Peter", "Max", "Marie"]
  names.each do |name|
    Chatroom.create(name: name)
    puts "chatroom with name #{name} created"
  end
end

seed_chatrooms
