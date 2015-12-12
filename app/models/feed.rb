class Feed < ActiveRecord::Base
  belongs_to :feeder
  belongs_to :question
  validates :priority, :feeder, :question, presence: true
  validates :priority, :feeder, :question, numericality: { only_integer: true }
end
