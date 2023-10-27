class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  attribute :text, :string

  private

  def update_post_counter
    author.update(posts_counter: author.posts.all.length)
  end
end
