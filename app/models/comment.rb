class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  attribute :text, :string

  private

  def update_comment_counter
    post.update(comments_counter: post.comments.all.length)
  end
end
