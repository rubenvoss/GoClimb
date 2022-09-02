class Trip < ApplicationRecord
  belongs_to :crag
  belongs_to :user
  has_one :profile, through: :user
  validates :name, :start_date, :end_date, :crag_id, presence: true
end
