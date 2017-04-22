class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: {minimum: 10}
  validates :content, presence: true
  validates :category, presence: true
  mount_uploader :image, ImageUploader

  scope :recent, ->{order created_at: :desc}
  scope :except_id, ->id do
    where("id != ?", id).limit Settings.related_item
  end

  scope :search, ->search do
    where("title like ?", "%#{search}%").limit Settings.limit_post
  end
end
