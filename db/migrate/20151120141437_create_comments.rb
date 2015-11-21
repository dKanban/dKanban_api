class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :demand_id
      t.integer :user_owner_id

      t.timestamps null: false
    end
  end

  def up
    add_attatchment :comments, :attatchment
  end

  def down
    remove_attatchment :comments, :attatchment
  end

end
