class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_many_attached :photos

  validates :legend, presence: true
  validates :legend, length: { maximum: 500 }
  has_many :reviews, dependent: :destroy
end
