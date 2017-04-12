class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: {minimum: 10}
  validates :content, presence: true
  validates :category, presence: true
  mount_uploader :image, ImageUploader
end
