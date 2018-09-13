class FriendRequestsController < ApplicationController
  #before_action :set_friend_request, only: [:show, :edit, :destroy]

  # GET /friend_requests
  # GET /friend_requests.json
  def index

    @incoming_requests = FriendRequest.incoming_requests(current_user)
    @send_requests = FriendRequest.send_requests(current_user)
    @users = ((User.where.not(id: current_user) - @send_requests) - @incoming_requests) - current_user.friends

  end

  # GET /friend_requests/1
  # GET /friend_requests/1.json
  def show
  end

  # GET /friend_requests/new
  def new

    @friend_request = FriendRequest.new

  end

  # GET /friend_requests/1/edit
  def edit
  end

  # POST /friend_requests
  # POST /friend_requests.json
  def create

    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: friend)

    if @friend_request.save
        redirect_to friend_requests_path
    else
      redirect_to authenticated_root
    end

  end

  # PATCH/PUT /friend_requests/1
  # PATCH/PUT /friend_requests/1.json
  def update
    @friend_request = FriendRequest.where(user_id: params[:id], friend_id: current_user).first
    @friend_request.accept
    # FriendRequest.accept(current_user, @friend_request.user)
    # @friend_request.destroy

    respond_to do |format|
      format.html { redirect_to friend_requests_url, notice: 'Friend request was successfully updated.' }
      format.json { head :no_content }
    end
  end

  # DELETE /friend_requests/1
  # DELETE /friend_requests/1.json
  def destroy

    @friend_request.destroy
    respond_to do |format|
      format.html { redirect_to friend_requests_url, notice: 'Friend request was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_request
        @friend_request = FriendRequest.where(user_id: current_user, friend_id: params[:id]).first

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_request_params
      params.require(:friend_request).permit(:user_id, :friend_id)
    end
end
