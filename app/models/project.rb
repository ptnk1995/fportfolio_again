class Project < ApplicationRecord
  belongs_to :category
  has_many :feature_projects, dependent: :destroy
  has_and_belongs_to_many :features
  has_many :technique_projects, dependent: :destroy
  has_many :techniques, through: :technique_projects
  has_many :participates, dependent: :destroy
end
