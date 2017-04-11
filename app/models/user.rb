class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :participates, dependent: :destroy
  has_many :projects, through: :participates
  has_many :messages
  has_many :rooms
  has_many :posts

  mount_uploader :avatar, ImageUploader

  validates :name, presence: true, length: {maximum: 50}

  scope :order_by_newest, ->{order created_at: :desc}

  ROLES = {admin: "Admin", user: "User"}
end
