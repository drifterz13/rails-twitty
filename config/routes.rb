Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
  devise_for :users

  root "home#index"

  post "/likes/:post_id", to: "likes#like", as: "likes"
end
