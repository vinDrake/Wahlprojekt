class Selection < ActiveRecord::Base
  belongs_to :tag
  belongs_to :feeder
  has_one :user, through: :feeder
  validates :tag, :feeder, presence: true
  validates :tag, :feeder, numericality: { only_integer: true }
end
