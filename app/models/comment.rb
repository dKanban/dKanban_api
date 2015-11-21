class Comment < ActiveRecord::Base



  belongs_to :user_owner, :class_name => 'User', :foreign_key => 'user_owner_id'
  belongs_to :demand, :class_name => 'Demand', :foreign_key => 'demand_id'

  validates  :user_owner_id, :demand_id, :content, presence: true

  has_attached_file :attatchment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

end
