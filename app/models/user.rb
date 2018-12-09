class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friend_requests, dependent: :destroy

  has_many :friend_ships, dependent: :destroy
  has_many :friends, through: :friend_ships
  has_many :inverse_friend_ships, class_name: "FriendShip", foreign_key: "friend_id"
  has_many  :inverse_friends, through: :inverse_friend_ships, source: :user
  has_many :posts
  has_many :comments
  has_many :likes

  def remove_friend(current_user, friend)

    current_user.friends.destroy(friend)
    friendship = friend.friend_ships.find_by(friend: current_user)
    friendship.destroy if friendship

  end


end
