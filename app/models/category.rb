class Category < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :posts, dependent: :destroy
  belongs_to :target, polymorphic: true

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  enum target_type: {blog: 0, project: 1}
end
