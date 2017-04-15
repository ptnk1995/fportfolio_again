class Room < ApplicationRecord
  belongs_to :user
  has_many :messages
  belongs_to :project
end
