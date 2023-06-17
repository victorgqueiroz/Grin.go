class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips
  has_one_attached :photo

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
