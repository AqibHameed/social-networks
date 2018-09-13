class FriendShipsController < ApplicationController
  before_action :set_friend, only: :destroy

  def index

    @friends = current_user.friends

  end

  def destroy

    current_user.remove_friend(current_user, @friend)
    respond_to do |format|
      format.html { redirect_to friend_ships_path, notice: 'successfully Unfriend.' }
      format.json { head :no_content }
    end

  end

  private

  def set_friend

    @friend = current_user.friends.find(params[:id])

  end

end
