class Group < ActiveRecord::Base
  has_many :memberships
  has_many :user, through: :memberships
  validates :name, presence: true
end
