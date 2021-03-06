class Question < ActiveRecord::Base
  has_many :answers
  has_many :repleys
  has_many :user, through: :repleys
  has_many :elements
  has_many :challenges, through: :elements
  has_many :feeds
  has_many :feeder, through: :feeds
  has_many :ties, :class_name => 'Tie'
  has_many :tags, through: :ties
end
