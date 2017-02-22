class RenameUsersToRegistrations < ActiveRecord::Migration[5.0]
  def change
    rename_table :users, :registrations
  end
end
