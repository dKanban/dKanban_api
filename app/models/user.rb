class User < ActiveRecord::Base


  validates :auth_token, uniqueness: true

  has_many :developed_demands, :class_name => "Demand", inverse_of: :developer_owner, foreign_key: :developer_owner_id
  has_many :requested_demands, :class_name => "Demand", inverse_of: :client_owner, foreign_key: :client_owner_id
  has_many :comments, :class_name => "Comment", inverse_of: :user_owner, foreign_key: :user_owner_id

  before_create :generate_authentication_token!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end



end
