class Crag < ApplicationRecord
  belongs_to :country
  has_many :profiles
  has_many :activities
  validates :name, :lat, :long, presence: true
  has_one_attached :photo

  # geocoder config
  # include Geocoder::Model::Mongoid
  # reverse_geocoded_by :lat, :long
  # after_validation :reverse_geocode # auto-fetch address

  # makes crags searchable for names
  include PgSearch::Model
  multisearchable against: [:name]
end
