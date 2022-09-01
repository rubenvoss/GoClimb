require "open-uri"
require 'faker'



puts "cleaning database..."
Profile.destroy_all
Trip.destroy_all
Crag.destroy_all
Country.destroy_all
Message.destroy_all
Chatroom.destroy_all
Activity.destroy_all
Review.destroy_all

# leave this commented if you want to stay logged in as a user
User.destroy_all


Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end
