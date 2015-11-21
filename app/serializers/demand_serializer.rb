class DemandSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :priority, :comments,  :created_at, :updated_at
  belongs_to :client_owner
  belongs_to :developer_owner
end
