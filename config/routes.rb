Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  devise_for :users

  root "home#index"

  post "/likes/:post_id", to: "likes#like", as: "likes"
end
