require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with valid attributes" do
    user = User.create(name: "User", email: "user@example.com", posts_counter: 0)
    post = Post.create(title: "Sample Title", author: user, comments_counter: 0, likes_counter: 0)
    comment = Comment.new(text: "Sample Comment", post: post, author: user)
    expect(comment).to be_valid
  end

  it "is not valid without text" do
    comment = Comment.new(text: nil)
    expect(comment).to_not be_valid
  end

  it "updates the associated post's comments_counter after saving" do
    user = User.create(name: "User", email: "user@example.com", posts_counter: 0)
    post = Post.create(title: "Sample Title", author: user, comments_counter: 0, likes_counter: 0)
    comment = Comment.create(text: "Sample Comment", post: post, author: user)
    post.reload
    expect(post.comments_counter).to eq(1)
  end
end
