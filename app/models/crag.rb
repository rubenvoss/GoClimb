class Crag < ApplicationRecord
  belongs_to :country
  has_many :profiles
  validates :name, :lat, :long, presence: true
  has_one_attached :photo

  # geocoder config
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode # auto-fetch address

  # makes crags searchable for names
  include PgSearch::Model
  multisearchable against: [:name]
end
