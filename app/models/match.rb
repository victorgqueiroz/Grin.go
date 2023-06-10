class Match < ApplicationRecord
  belongs_to :place
  belongs_to :user, class_name: "User"
  belongs_to :guider, class_name: "User"
end
