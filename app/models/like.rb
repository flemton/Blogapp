class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :author, presence: true
  validates :post, presence: true

  after_save :update_like_counter

  private

  def update_like_counter
    post.update(likes_counter: post.likes.count)
  end
end
