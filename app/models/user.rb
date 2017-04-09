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

  ROLES = {admin: "Admin", user: "User"}
end
