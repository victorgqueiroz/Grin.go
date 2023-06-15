class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :first_user, class_name: "User"
  belongs_to :second_user, class_name: "User"
end
