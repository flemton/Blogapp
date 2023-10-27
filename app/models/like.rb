class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_counter

  private

  def update_like_counter
    post.update(likes_counter: post.likes.all.length)
  end
end
