class Feature < ApplicationRecord
  has_many :feature_projects, dependent: :destroy
  has_many :projects, through: :feature_projects
  mount_uploader :image, ImageUploader
end
