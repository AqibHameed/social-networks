class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :avatar
  has_many :comments
  has_many :likes, as: :likeable

end
