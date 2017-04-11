class Project < ApplicationRecord
  belongs_to :category
  has_many :feature_projects, dependent: :destroy
  has_many :features, through: :feature_projects
  has_many :technique_projects, dependent: :destroy
  has_many :techniques, through: :technique_projects
  has_many :participates, dependent: :destroy
  has_many :images

  accepts_nested_attributes_for :participates, allow_destroy: true
end
