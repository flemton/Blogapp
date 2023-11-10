class AddPasswordInUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string   :encrypted_password
    end
  end
end
