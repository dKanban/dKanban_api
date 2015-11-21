class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :description, :activity_type, :created_at, :updated_at
  belongs_to :demand
end
