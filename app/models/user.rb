class User < ApplicationRecord
  before_create { self.email = email.downcase }
  validates_presence_of :email, :password_digest
  has_secure_password
end
