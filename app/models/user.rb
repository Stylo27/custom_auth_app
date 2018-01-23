class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  has_many :posts

  # validates_presence_of :email, :password, :password_confirmation
  # validates :email, uniqueness: true
end
