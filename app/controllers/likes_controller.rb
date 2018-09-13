class LikesController < ApplicationController
  before_action :set_post

  def index
  end

  def new
  end

  def create

    if params[:post_id].present? && params[:comment_id].present?

      @comment = Comment.find(params[:comment_id])
      comment_like = @comment.likes.build
      comment_like.user = current_user

      if comment_like.save

           redirect_to posts_path, notice: 'Comment was successfully Like.'
      else

        redirect_to posts_path, notice: 'Comment was not Like.'

      end


    else

      post_like = @post.likes.build(user_id: current_user)
      post_like.user = current_user

      if post_like.save

        redirect_to posts_path, notice: 'Post was successfully Like.'

      else

        redirect_to posts_path, notice: 'Post was not Like.'

      end

    end

  end

  def update
  end

  def destroy

    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path, notice: 'successfully unlike.'

  end

  def set_post

    @post = Post.find(params[:post_id])

  end
end
