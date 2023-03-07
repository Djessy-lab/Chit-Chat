Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts, only: %i[index create update destroy] do
    resources :child_posts, only: %i[create]
    resources :comments, only: %i[create]
    resources :post_likes, only: %i[create]
  end
  resources :comments, only: %i[update destroy] do
    resources :comment_likes, only: %i[create]
  end
  resources :post_likes, only: %i[destroy]
  resources :comment_likes, only: %i[destroy]
  resources :children, only: %i[create destroy] do
    resources :filiations, only: %i[create]
  end
  resources :filiations, only: %i[update]
end
