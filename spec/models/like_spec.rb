require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'User', email: 'user@example.com', posts_counter: 0)
    post = Post.create(title: 'Sample Title', author: user, comments_counter: 0, likes_counter: 0)
    like = Like.new(author: user, post:)
    expect(like).to be_valid
  end

  it 'is not valid without an author' do
    post = Post.create(title: 'Sample Title')
    like = Like.new(post:)
    expect(like).to_not be_valid
  end

  it 'is not valid without a post' do
    user = User.create(name: 'User', email: 'user@example.com', posts_counter: 0)
    like = Like.new(author: user)
    expect(like).to_not be_valid
  end

  it "updates the associated post's likes_counter after saving" do
    user = User.create(name: 'User', email: 'user@example.com', posts_counter: 0)
    post = Post.create(title: 'Sample Title', author: user, comments_counter: 0, likes_counter: 0)
    Like.create(author: user, post:)
    post.reload
    expect(post.likes_counter).to eq(1)
  end
end
