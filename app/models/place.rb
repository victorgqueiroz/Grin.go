class Place < ApplicationRecord
  has_many :users, through: :trip
  has_many :trips
  validates :city, :country, :neighborhood, presence: true
end
