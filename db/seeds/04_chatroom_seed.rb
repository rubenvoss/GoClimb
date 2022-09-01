puts "seeding chatrooms..."
crags_data.each do |crag_data|
  chatroom_name = crag_data[:name]
  Chatroom.create(name: chatroom_name)
end
