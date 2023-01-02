class HomeController < ApplicationController
  def index
    @posts = Post.includes(:likes).all.order(created_at: :desc)
  end
end
