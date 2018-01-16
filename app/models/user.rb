class User < ApplicationRecord
  has_many :posts
  has_secure_password
  before_create { self.email = email.downcase }
  before_create { generate_token }
  validates_presence_of :email, :password_digest, :password_confirmation
  validates :email, uniqueness: true


  def is_admin?
    true if self.admin_status
  end

  def generate_token
    self.auth_token = SecureRandom.hex(10)
  end
end
