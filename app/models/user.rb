class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :activities
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :trips
  has_many :reviews
  has_one :profile
  validates :email, :encrypted_password, presence: true

  def unread_messages
    chatrooms.map(&:messages).flatten.reject { |message| message.user == self || message.read || message.content.nil? }
    # same thing as: chatrooms.map { |chatroom| chatroom.messages }
  end
end
