class Challenge < ActiveRecord::Base
  has_many :participations
  has_many :users, through: :participations
  has_many :elements
  has_many :questions, through: :elements
  validates :name, :max_challenge_time, :latest_end, :strikes, presence: true
  validates :alive, :strict_order, inclusion: { in: [true, false] }
end
