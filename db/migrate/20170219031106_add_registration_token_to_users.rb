class AddRegistrationTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :registration_token, :string, unique: true
    add_index :users, :registration_token
  end
end
