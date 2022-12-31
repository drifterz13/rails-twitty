Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  devise_for :users

  root "home#index"

  post "/like/posts/:post_id", to: "likes#like_post", as: "like_post"
  post "/like/comments/:comment_id", to: "likes#like_comment", as: "like_comment"
end
