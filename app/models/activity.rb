class Activity < ApplicationRecord
  belongs_to :user
  validates :name, :lat, :long, presence: true
end
