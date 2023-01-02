Rails.application.routes.draw do
  resources :posts, except: %i[edit update] do
    resources :comments, except: %i[edit update]
  end

  devise_for :users

  root 'home#index'

  post '/like/posts/:post_id', to: 'likes#like_post', as: 'like_post'
  post '/dislike/posts/:post_id', to: 'likes#dislike_post', as: 'dislike_post'
  post '/like/comments/:comment_id', to: 'likes#like_comment', as: 'like_comment'
  post '/dislike/comments/:comment_id', to: 'likes#dislike_comment', as: 'dislike_comment'
end
