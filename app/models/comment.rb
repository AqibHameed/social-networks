class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :post
    has_many :likes, as: :likeable

    delegate :first_name, to: :user, prefix: true

end
