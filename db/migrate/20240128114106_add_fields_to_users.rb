class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :mobile, :string
    add_column :users, :dob, :date
    add_column :users, :gender, :string

    add_index :users, :mobile   
  end
end
