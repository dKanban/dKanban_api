class CleanModels < ActiveRecord::Migration
  def self.up
    drop_table :events
    drop_table :locations
    drop_table :physical_people
    drop_table :routes
    drop_table :routes_locations
    drop_table :user_locations
  end
end
