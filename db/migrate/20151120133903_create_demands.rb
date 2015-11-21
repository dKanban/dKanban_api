class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.string :title
      t.string :description
      t.integer :client_owner_id
      t.integer :developer_owner_id
      t.integer :status
      t.integer :priority

      t.timestamps null: false
    end
  end
end
