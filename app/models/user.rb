class User < ApplicationRecord
  has_secure_password
  before_create { self.email = email.downcase }
  validates_presence_of :email, :password_digest, :password_confirmation
  validates :email, uniqueness: true
end
