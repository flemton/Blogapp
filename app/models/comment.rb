class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  attribute :text, :string

  after_save :update_post_counter

  private

  def update_comment_counter
    post.update(comments_counter: post.comments.all.length)
  end
end
