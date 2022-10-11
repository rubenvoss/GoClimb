class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_one :profile, through: :user
  validates :trip_id, presence: true
end
