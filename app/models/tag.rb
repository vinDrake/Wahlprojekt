class Tag < ActiveRecord::Base
  has_many :ties, :class_name => 'Tie'
  has_many :questions, through: :ties
  has_many :selections
  has_many :feeder, through: :selections
end
