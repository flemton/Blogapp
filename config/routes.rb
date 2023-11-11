Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  get '/users', to: 'users#index'  # For displaying all users
  get '/users/:id', to: 'users#show', as: 'user'  # For displaying a single user
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts' # For displaying a user's postsget '/users/:user_id/posts/:post_id', to: 'posts#show', as: 'user_post'
  get '/users/:user_id/posts/:post_id', to: 'posts#show', as: 'user_post' # For displaying a specific post by user
  
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
  resources :posts do
    resources :comments, only: [:new, :create]
  end

  resources :users do
    resources :posts, only: [:new, :create]
  end
end
