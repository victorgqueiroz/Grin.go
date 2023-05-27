class Place < ApplicationRecord
  has_many :users, through: :trip
  has_many :trips
  validates :cities, :countries, :neighborhood, presence: true
end
