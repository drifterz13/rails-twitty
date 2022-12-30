class LikesController < ApplicationController
  def like
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post = Post.find(params[:post_id])

    puts @like

    if @like.nil?
      @like = Like.new(user_id: current_user.id, post_id: params[:post_id])

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
end
