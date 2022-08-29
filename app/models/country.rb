class Country < ApplicationRecord
  has_many :crags
  validates :name, presence: true
end
