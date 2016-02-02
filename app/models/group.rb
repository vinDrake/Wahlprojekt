class Group < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :user, through: :memberships
  validates :name, presence: true, uniqueness: true
end
