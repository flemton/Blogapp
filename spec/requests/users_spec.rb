require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a successful response for the users index' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the users index template' do
      get users_path
      expect(response).to render_template(:index)
    end
    
    it "includes the correct placeholder text in the response body" do
      get users_path
      expect(response.body).to include("User name") # Placeholder text in the view
    end
  end

  describe 'GET /users/:id' do
    it 'returns a successful response for a user' do
      user = User.new(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                      posts_counter: 1) # Create a user
      puts(user_path(user))
      get user_path(user)
      expect(response).to have_http_status(200)
    end

    it 'renders the user show template' do
      user = User.new(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                      posts_counter: 1)
      get user_path(user)
      expect(response).to render_template(:show)
    end
  end
end
