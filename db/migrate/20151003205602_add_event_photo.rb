class AddEventPhoto < ActiveRecord::Migration
  def up
    add_attachment :events, :photo
  end

  def down
    remove_attachment :events, :photo
  end
end
