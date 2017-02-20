class AddAlreadyRemindedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reminded_to_finish_applying, :boolean
  end
end
