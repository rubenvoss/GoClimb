class Crag < ApplicationRecord
  belongs_to :country
  has_many :profiles
  validates :name, :lat, :long, presence: true
  has_one_attached :photo

  # makes crags searchable for names
  include PgSearch::Model
  multisearchable against: [:name]
end
