class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :completed

  belongs_to :list
end
