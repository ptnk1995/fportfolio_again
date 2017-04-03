class Project < ApplicationRecord
  belongs_to :category
  has_many :feature_projects
  has_many :features, through: :feature_projects
  has_many :participates, dependent: :destroy
end
