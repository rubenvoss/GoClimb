class Crag < ApplicationRecord
  belongs_to :country
  has_many :profiles
end
