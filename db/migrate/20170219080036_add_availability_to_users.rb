class AddAvailabilityToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :availability, :text, array: true, default: []
  end
end
