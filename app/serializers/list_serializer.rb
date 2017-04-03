class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :public

  belongs_to :user
  has_many :items
end
