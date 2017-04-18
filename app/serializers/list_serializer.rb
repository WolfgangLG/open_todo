class ListSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :permission, :created_at, :updated_at, :title, :description

  belongs_to :user
  has_many :items
end
