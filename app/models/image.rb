class Image < ApplicationRecord
  belongs_to :target, polymorphic: true
  has_attached_file :image, :styles => { :medium => "300x300>",:thumb => "100x100>" }
    validates_attachment :avatar, :content_type => /\Aimage\/.*\Z/
end
