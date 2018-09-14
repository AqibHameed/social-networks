module PostsHelper

  def current_user_post_like(post, current_user)

      post.likes.where(user_id: current_user)

  end

  def current_user_comment_like(comment, current_user)

    comment.likes.where(user_id: current_user)

  end

end
