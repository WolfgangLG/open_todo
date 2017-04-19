class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates :name, presence: true
end
