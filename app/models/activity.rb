class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :crag
  validates :name, :lat, :long, presence: true
end
