class AddCommentsCounterToPosts < ActiveRecord::Migration[7.0]
    def change
        change_table :posts do |t|
        t.integer :comments_counter, default: 0
        t.integer :likes_counter, default: 0
      end
  end
end
