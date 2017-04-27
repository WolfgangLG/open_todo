class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  before_save { self.user_id = list.user_id }

  validates :name, presence: true
end
