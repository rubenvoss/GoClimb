class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :activities
  has_many :messages
  has_many :chatrooms, -> { distinct }, through: :messages
  has_many :trips
  has_many :enrollments
  has_many :reviews
  has_one :profile
  validates :email, :encrypted_password, presence: true

  def unread_messages
    chatrooms.map(&:messages).flatten.reject { |message| message.user == self || message.read || message.content.nil? }
    # same thing as: chatrooms.map { |chatroom| chatroom.messages }
  end

  def mark_as_read_with(other_user)
    chatroom = chatrooms.where(id: other_user.chatrooms).first
    messages = chatroom.messages.reject { |message| message.user == self || message.read || message.content.nil? }
    messages.each do |message|
      message.update(read: true)
    end
  end
end
