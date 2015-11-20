class Demand < ActiveRecord::Base

  validates  :title, :developer_owner_id, :status, presence: true

  belongs_to :client_owner, :class_name => 'User', :foreign_key => 'client_owner_id'
  belongs_to :developer_owner, :class_name => 'User', :foreign_key => 'developer_owner_id'

  has_many :comments, :class_name => "Comment", inverse_of: :demand
  has_many :activities, :class_name => "Activity", inverse_of: :demand


end
