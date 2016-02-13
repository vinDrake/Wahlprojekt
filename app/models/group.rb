class Group < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :user, through: :memberships
  validates :name, presence: true, uniqueness: true, length: { in: 3..255 }
end
