# Controller that responsible for like/dislike post and comment.
class LikesController < ApplicationController
  before_action :set_post, only: %i[like_post dislike_post]
  before_action :set_comment, only: %i[like_comment dislike_comment]

  def like_post
    @like = Like.new(user_id: current_user.id, likeable_id: params[:post_id], likeable_type: "Post")

    respond_to do |format|
      if @like.save
        format.turbo_stream
      else
        format.html { render :root, status: :unprocessable_entity }
        format.turbo_stream { flash.now[:alert] = "Cannot like post id: #{params[:post_id]}" }
      end
    end
  end

  def dislike_post
    @like = Like.find_by(user_id: current_user.id, likeable_id: params[:post_id], likeable_type: "Post")
    @like.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  def like_comment
    @like = Like.new(user_id: current_user.id, likeable_id: params[:comment_id], likeable_type: "Comment")

    respond_to do |format|
      if @like.save
        format.turbo_stream
      else
        format.html { render :root, status: :unprocessable_entity }
        format.turbo_stream { flash.now[:alert] = "Cannot like comment id: #{params[:comment_id]}" }
      end
    end
  end

  def dislike_comment
    @like = Like.find_by(user_id: current_user.id, likeable_id: params[:comment_id], likeable_type: "Comment")
    @like.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
