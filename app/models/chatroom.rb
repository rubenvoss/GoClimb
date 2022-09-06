class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  def other_user(current_user)
    users.find{ |user| user != current_user } # users = self.users
  end
end
