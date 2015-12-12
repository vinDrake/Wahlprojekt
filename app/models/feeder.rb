class Feeder < ActiveRecord::Base
  belongs_to :user
  has_many :feeds
  has_many :questions, through: :feeds
  validates :user, presence: true
  validates :user, numericality: { only_integer: true }
end
