class Review < ApplicationRecord
  belongs_to :user
  belongs_to :image
  validates :content, length: {minimum: 200}
end
