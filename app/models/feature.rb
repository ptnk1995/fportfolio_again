class Feature < ApplicationRecord
  has_many :feature_projects, dependent: :destroy
end
