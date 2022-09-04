class Profile < ApplicationRecord
  belongs_to :crag
  belongs_to :user
  has_one_attached :photo
  validates :name, :photo, :age, presence: true
  has_many :trips, through: :user
  has_many :reviews
end
