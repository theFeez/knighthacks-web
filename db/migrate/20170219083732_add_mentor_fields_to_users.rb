class AddMentorFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :why_mentor, :text
    add_column :users, :tech_stack, :text
  end
end
