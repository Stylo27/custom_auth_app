class User < ApplicationRecord
  has_secure_password
  before_create { self.email = email.downcase }
  before_create { generate_token(:auth_token) }
  validates_presence_of :email, :password_digest, :password_confirmation
  validates :email, uniqueness: true

  def generate_token(column)
    begin
      self[column] = SecureRandom.hex(10)
    end while User.exists?(column => self[column])
  end
end
