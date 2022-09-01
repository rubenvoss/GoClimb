class Trip < ApplicationRecord
  belongs_to :crag
  belongs_to :user
  belongs_to :profile, through: :user
  validates :name, :start_date, :end_date, presence: true
end
