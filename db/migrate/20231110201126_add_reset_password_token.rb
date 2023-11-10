class AddResetPasswordToken < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string   :reset_password_token
    end
  end
end
