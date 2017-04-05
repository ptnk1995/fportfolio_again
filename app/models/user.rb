class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :participates, dependent: :destroy
  has_many :projects, through: :participates

  mount_uploader :avatar, ImageUploader

  ROLES = {admin: "Admin", user: "User"}
end
