class Review < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  validates :comment, :stars, presence: true
end
