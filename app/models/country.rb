class Country < ApplicationRecord
  has_many :crags
  validates :name, presence: true

  # makes countries searchable for names
  include PgSearch::Model
  multisearchable against: :name
end
