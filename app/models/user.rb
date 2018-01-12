class User < ApplicationRecord
  before_create { self.email = email.downcase }
  validates_presence_of :email, :password
  has_secure_password
end
