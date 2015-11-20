class AddUserFullNameAndProfile < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :profile_type, :integer
  end
end
