class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friend_requests, dependent: :destroy

  has_many :friend_ships, dependent: :destroy
  has_many :friends, through: :friend_ships

  def remove_friend(friend)
    current_user.friends.destroy(friend)
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end

end
