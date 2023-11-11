class AddPostsCounterToUser < ActiveRecord::Migration[7.0]
  def change
      change_table :users do |t|
      t.integer :posts_counter, default: 0
    end
  end
end