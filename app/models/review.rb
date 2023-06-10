class Review < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  validates :content, length: {minimum: 1}
end
