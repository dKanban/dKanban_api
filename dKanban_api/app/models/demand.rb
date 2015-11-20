class Demand < ActiveRecord::Base

  validates  :title, :developer_owner_id, :status, presence: true
  validates :status, :priority, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}

  belongs_to :client_owner, :class_name => 'User', :foreign_key => 'client_owner_id'
  belongs_to :developer_owner, :class_name => 'User', :foreign_key => 'developer_owner_id'

  has_many :comments, :class_name => "Comment", inverse_of: :demand, foreign_key: :demand_id
  has_many :activities, :class_name => "Activity", inverse_of: :demand, foreign_key: :demand_id


end
