class Crag < ApplicationRecord
  belongs_to :country
  has_many :profiles
  validates :name, :lat, :long, presence: true
  has_one_attached :photo
end
