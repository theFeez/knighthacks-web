class AddWrapupToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :proud_project, :text
    add_column :users, :event_expectations, :text
    add_column :users, :additional_remarks, :text
  end
end
