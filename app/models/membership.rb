class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validates :user, :group presence: true
  validates :user, :group numericality: { only_integer: true } # Muessen beides IDs sein
end
