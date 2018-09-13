class CommentsController < ApplicationController
  before_action :set_post

  def index

     @comments = @post.comments

  end

  def new

     @comment = @post.comments.build

  end

  def create

      @comment = @post.comments.build(comment_params)

      if @comment.save

           redirect_to posts_path, notice: 'Comment was successfully Created.'

      else

          redirect_to posts_path, notice: 'Comment not created'

      end

  end

  def update
  end

  def destroy
  end

  private

  def set_post

       @post = Post.find(params[:post_id])

  end

  private

  def comment_params

      params.require(:comment).permit(:content, :user_id)

  end
end
