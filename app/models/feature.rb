class Feature < ApplicationRecord
  has_many :feature_projects, dependent: :destroy
  has_and_belongs_to_many :projects
  mount_uploader :image, ImageUploader
end
