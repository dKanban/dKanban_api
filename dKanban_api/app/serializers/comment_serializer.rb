class UserSerializer < ActiveModel::Serializer
  attributes :id, :content, :attatchment, :user_owner, :demand, :created_at, :updated_at, :auth_token
end
