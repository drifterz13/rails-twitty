class LikesController < ApplicationController
  def like_post
    @like = Like.find_by(user_id: current_user.id, likeable_id: params[:post_id], likeable_type: "Post")
    @post = Post.find(params[:post_id])

    if @like.nil?
      @like = Like.new(user_id: current_user.id, likeable_id: params[:post_id], likeable_type: "Post")

      respond_to do |format|
        if @like.save
          format.turbo_stream
        else
          format.html { render :root, status: :unprocessable_entity }
          format.turbo_stream { flash.now[:alert] = "Cannot like post id: #{params[:post_id]}" }
        end
      end
    else
      @like.destroy

      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def like_comment
    @like = Like.find_by(user_id: current_user.id, likeable_id: params[:comment_id], likeable_type: "Comment")
    @comment = Comment.find(params[:comment_id])

    if @like.nil?
      @like = Like.new(user_id: current_user.id, likeable_id: params[:comment_id], likeable_type: "Comment")

      respond_to do |format|
        if @like.save
          format.turbo_stream
        else
          format.html { render :root, status: :unprocessable_entity }
          format.turbo_stream { flash.now[:alert] = "Cannot like comment id: #{params[:comment_id]}" }
        end
      end
    else
      @like.destroy

      respond_to do |format|
        format.turbo_stream
      end
    end
  end
end
