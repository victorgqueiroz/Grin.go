class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :reviews, presence: true
  validates :reviews, length: { maximum: 500 }
  has_many :reviews, dependent: :destroy
end
