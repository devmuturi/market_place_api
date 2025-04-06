class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address"
end
