Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/users', to: 'users#index'  # For displaying all users
  get '/users/:id', to: 'users#show', as: 'user'  # For displaying a single user
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts' # For displaying a user's posts

end
