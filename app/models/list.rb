class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  enum permission: [:confidential, :viewable, :open]

  PERMISSIONS = %w{ confidential viewable open }

  validates :title, presence: true
  validates :permission, inclusion: PERMISSIONS
end
