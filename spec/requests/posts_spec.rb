require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'returns a successful response for the posts index' do
      user = User.new(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                      posts_counter: 1)
      get user_posts_path(user)
      expect(response).to have_http_status(200)
    end

    it 'renders the posts index template' do
      user = User.new(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                      posts_counter: 1)
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns a successful response for a post' do
      user = User.new(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                      posts_counter: 1)
      post = Post.new(
        id: 1,
        title: 'Sample Title',
        author: user,
        comments_counter: 2,
        likes_counter: 3
      )
      get user_post_path(user, post)
      expect(response).to have_http_status(200)
    end

    it 'renders the post show template' do
      user = User.new(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                      posts_counter: 1)
      post = Post.new(
        id: 1,
        title: 'Sample Title',
        author: user,
        comments_counter: 2,
        likes_counter: 3
      )
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end
  end
end
