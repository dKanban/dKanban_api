class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name,:created_demands, :developed_demands , :profile_type, :created_at, :updated_at, :auth_token
end
