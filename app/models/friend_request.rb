class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'



  def self.incoming_requests(current_user)

       FriendRequest.where(friend: current_user).map{|incoming_request| incoming_request.user}

  end

  def self.send_requests(current_user)

       current_user.friend_requests.map{|friend_request| friend_request.friend}

  end

  def accept
    user.friends << friend
    friend.friend_ships.create(friend: user)
    destroy
  end
end
