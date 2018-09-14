class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: [:show, :edit, :destroy]

  def index

    @incoming_requests = FriendRequest.incoming_requests(current_user)
    @send_requests = FriendRequest.send_requests(current_user)
    @users = ((User.where.not(id: current_user) - @send_requests) - @incoming_requests) - current_user.friends

  end

  def create

    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.build(friend: friend)

    if @friend_request.save
      redirect_to friend_requests_path, notice: 'Friend request was successfully Sent.'
    else
      redirect_to authenticated_root
    end

  end

  def update

    @friend_request = FriendRequest.where(user_id: params[:id], friend_id: current_user).first
    @friend_request.accept

    respond_to do |format|
      format.html { redirect_to friend_requests_url, notice: 'Friend request was successfully Accepted.' }
    end

  end

  def destroy

    @friend_request.destroy
    respond_to do |format|
      format.html { redirect_to friend_requests_url, notice: 'Friend request was successfully deleted.' }
    end

  end

  private

  def set_friend_request

    @friend_request = FriendRequest.where(user_id: current_user, friend_id: params[:id]).first

  end

end
