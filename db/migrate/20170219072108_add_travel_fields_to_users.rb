class AddTravelFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :traveling_from_city, :string
    add_column :users, :traveling_to_city, :string
    add_column :users, :travel_accommodations_needed, :boolean
  end
end
