class Group < ActiveRecord::Base
  has_many :memberships
  has_many :user, through: :memberships
end
