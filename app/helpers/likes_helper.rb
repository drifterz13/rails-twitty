module LikesHelper
  def liked_by_current_user(post)
    liked_by_ids = post.likes.pluck(:user_id)
    liked_by_ids.include?(current_user.id)
  end

  def toggle_like_path(post)
    if liked_by_current_user(post)
      dislike_post_path(post.id)
    else
      like_post_path(post.id)
    end
  end

  def render_like_button_turbo_stream(post)
    turbo_stream.update dom_id(post, :like_button), partial: "likes/like_button", locals: { post: post }
  end
end
