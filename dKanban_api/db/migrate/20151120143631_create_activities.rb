class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :description
      t.integer :type
      t.integer :demand_id

      t.timestamps null: false
    end
  end
end
