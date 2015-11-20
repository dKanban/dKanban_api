class UserSerializer < ActiveModel::Serializer
  attributes :id, :demand, :description, :type, :created_at, :updated_at, :auth_token
end
