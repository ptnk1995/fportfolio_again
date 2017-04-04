class Contact < ApplicationRecord
  validates :name, presence: true,
    length: {maximum: Settings.contact.max_name_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.contact.max_email_length},
    format: {with: VALID_EMAIL_REGEX}
  validates :title, presence: true,
    length: {minimum: Settings.contact.min_title_length,
      maximum: Settings.contact.max_title_length}
  validates :content, presence: true,
    length: {minimum: Settings.contact.min_content_length,
      maximum: Settings.contact.max_content_length}
end
