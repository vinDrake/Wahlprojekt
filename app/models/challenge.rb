class Challenge < ActiveRecord::Base
  has_many :participations
  has_many :users, through: :participations
  has_many :elements
  has_many :questions, through: :elements
end
