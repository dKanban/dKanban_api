class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name, :profile_type, :created_at, :updated_at, :auth_token
end
