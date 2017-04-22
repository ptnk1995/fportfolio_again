class Project < ApplicationRecord
  belongs_to :category
  has_many :feature_projects, dependent: :destroy
  has_many :features, through: :feature_projects
  has_many :technique_projects, dependent: :destroy
  has_many :techniques, through: :technique_projects
  has_many :participates, dependent: :destroy
  has_many :users, through: :participates
  has_many :images, as: :target
  has_one :room, dependent: :destroy
  after_create :create_room

  validates :category, presence: true

  accepts_nested_attributes_for :participates, allow_destroy: true

  scope :recent, ->{order created_at: :desc}

  private
  def create_room
    Room.create! project_id: id
  end
end
