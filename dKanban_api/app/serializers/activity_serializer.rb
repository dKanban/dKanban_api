class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :description, :type, :created_at, :updated_at
  belongs_to :demand
end
