class Place < ApplicationRecord
  has_many :user
  validates :cities, :countries, :neighborhood, presence: true

end
