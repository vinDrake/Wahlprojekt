class Feeder < ActiveRecord::Base
  belongs_to :user
  has_many :feeds
  has_many :questions, through: :feeds
  validates :user, presence: true
end
