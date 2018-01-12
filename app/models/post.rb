class Post < ApplicationRecord
  validates :title, uniqueness: true
  validates_presence_of :title, :body
end
