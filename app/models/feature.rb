class Feature < ApplicationRecord
  has_many :feature_projects, dependent: :destroy

  mount_uploader :image, ImageUploader
end
