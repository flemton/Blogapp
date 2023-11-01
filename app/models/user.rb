class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  attribute :bio, :string

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :bio, length: { maximum: 255 }

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
