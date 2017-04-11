class Technique < ApplicationRecord
  has_many :technique_projects, dependent: :destroy
  has_many :projects, through: :technique_projects

  mount_uploader :image, ImageUploader
end
