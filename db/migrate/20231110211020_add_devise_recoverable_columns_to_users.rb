class AddDeviseRecoverableColumnsToUsers < ActiveRecord::Migration[7.0]
  change_table :users do |t|
    t.datetime   :reset_password_sent_at
  end
end
