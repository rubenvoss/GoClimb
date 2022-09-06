class Profile < ApplicationRecord
  validates :name, :photo, :age, :crag, presence: true
  belongs_to :crag
  belongs_to :user
  has_one_attached :photo
  has_many :trips, through: :user
  has_many :reviews
end
