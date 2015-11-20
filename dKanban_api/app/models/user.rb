class User < ActiveRecord::Base


  validates :auth_token, uniqueness: true

  has_many :developed_demands, :class_name => "Demand", inverse_of: :developer_owner
  has_many :created_demands, :class_name => "Demand", inverse_of: :client_owner

  before_create :generate_authentication_token!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def last_location
    locations.first
  end



end
