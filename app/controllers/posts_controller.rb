class PostsController < ApplicationController
  load_and_authorize_resource

  def index

    @posts = Post.all

  end

  def new

    @post = Post.new

  end

  def create

      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to authenticated_root_path, notice: 'Post was successfully Created.'
      else
        redirect_to authenticated_root_path, notice: 'Post not created'
      end

  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def post_params

    params.require(:post).permit(:content, :avatar)

  end

end
