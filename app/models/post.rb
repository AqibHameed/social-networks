class Post < ApplicationRecord

  belongs_to :user
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :comments
  has_many :likes, as: :likeable

end
