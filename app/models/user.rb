class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips
  has_many :guider_matches, class_name: 'Matches',
  foreign_key: 'guider'
  has_many :user_matches, class_name: 'Matches',
  foreign_key: 'user'
  # has_one_attached :photo

  before_validation :initial_classification

  validates :name, presence: true, length: { maximum: 100 }
  validates :about, :address, :language, :interests, :occupation, :nacionality, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :classification, numericality: { only_integer: true }
  validates :host, inclusion: { in: [true, false] }
  validates :visitor, inclusion: { in: [true, false] }

  private

  def initial_classification
    self.classification = 5
  end
end
