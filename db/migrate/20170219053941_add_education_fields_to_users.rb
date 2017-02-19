class AddEducationFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :university_name, :string
    add_column :users, :major, :string
    add_column :users, :university_email, :citext
    add_column :users, :expected_graduation, :string
    add_column :users, :born_on, :date
  end
end
