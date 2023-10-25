class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  attribute :author_id, :integer
  attribute :text, :string
end
