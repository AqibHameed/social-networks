class FriendShipsController < ApplicationController

  def index

        @friends = current_user.friends
    
  end

  def destroy

        current_user.remove_friend(@friend)

  end

end
