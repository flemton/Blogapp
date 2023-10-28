require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'User', email: 'user@example.com', posts_counter: 0)
    post = Post.new(
      title: 'Sample Title',
      author: user,
      comments_counter: 2,
      likes_counter: 3
    )
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid with a title exceeding 250 characters' do
    post = Post.new(title: 'a' * 251)
    expect(post).to_not be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post = Post.new(comments_counter: -1)
    expect(post).to_not be_valid
  end

  it 'is not valid with a negative likes_counter' do
    post = Post.new(likes_counter: -1)
    expect(post).to_not be_valid
  end

  it "updates the author's posts_counter after saving" do
    user = User.create(name: 'User', email: 'user@example.com', posts_counter: 0)
    Post.create(
      title: 'Sample Title',
      author: user,
      comments_counter: 2,
      likes_counter: 3
    )
    user.reload
    expect(user.posts_counter).to eq(1)
  end
end
