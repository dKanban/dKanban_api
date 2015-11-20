class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :attatchment, :created_at, :updated_at
  # belongs_to :user_owner
  # belongs_to :demand
end
