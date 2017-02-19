class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension "citext"

    create_table :users do |t|
      t.string :full_name
      t.citext :email
      t.string :phone
      t.string :shirt_fit_sex
      t.string :shirt_fit_size

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
