class Review < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  validates :rating, presence: true
end
