Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'feedbacks', to: "pages#feedbacks"
  get 'papers', to: "pages#papers"

  resources :posts, only: %i[index create update destroy], shallow: true do
    resources :comments, only: %i[create]
    resources :post_likes, only: %i[create destroy]
  end
  resources :comments, only: %i[update destroy], shallow: true do
    resources :comment_likes, only: %i[create destroy]
  end
  resources :children, only: %i[create destroy update], shallow: true do
    resources :filiations, only: %i[create update]
    resources :feedbacks, only: %i[index create update], shallow: false
    resources :papers, only: %i[index show], shallow: false
    get 'parent_feedbacks', to: 'feedbacks#parent_index'
  end
  resources :users, only: %i[index show update]
  resources :chatrooms, only: %i[index show new create destroy] do
    resources :messages, only: :create
  end
  resources :papers, only: %i[new create destroy]
end
