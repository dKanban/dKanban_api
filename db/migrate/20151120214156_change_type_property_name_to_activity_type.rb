class ChangeTypePropertyNameToActivityType < ActiveRecord::Migration
  def change
    add_column :activities, :activity_type, :integer

  end
end
