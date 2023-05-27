class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :review, presence: true
  validates :review, length: { maximum: 500 }
end
