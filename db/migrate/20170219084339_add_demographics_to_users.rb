class AddDemographicsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :race, :string
  end
end
