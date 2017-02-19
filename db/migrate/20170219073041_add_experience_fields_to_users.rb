class AddExperienceFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :number_of_hackathons, :string
    add_column :users, :github, :string
    add_column :users, :linkedin, :string
    add_column :users, :website, :string
    add_column :users, :additional_portfolio, :string
    add_column :users, :interests, :text
  end
end
