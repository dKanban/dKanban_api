class Activity < ActiveRecord::Base

  belongs_to :demand, :class_name => 'Demand', :foreign_key => 'demand_id'
  validates  :activity_type, :demand_id, :description, presence: true

end
