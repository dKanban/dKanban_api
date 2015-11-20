class UserSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :developer_owner, :client_owner, :status, :priority, :created_at, :updated_at, :auth_token
end
