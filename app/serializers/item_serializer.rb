class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :body

  belongs_to :list
end
